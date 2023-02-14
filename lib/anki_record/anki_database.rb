# frozen_string_literal: true

require "pry"

require_relative "anki_schema_definition"

module AnkiRecord
  ##
  # Represents an Anki SQLite3 database
  #
  # Use ::new to create an empty one or #open to create an object from an existing one
  class AnkiDatabase
    NAME_ERROR_MESSAGE = "The name argument must be a string without spaces."
    PATH_ERROR_MESSAGE = "*No .apkg file was found at the given path."
    STANDARD_ERROR_MESSAGE = <<-MSG
    An error occurred.
    The temporary *.anki21 database has been deleted.
    No *.apkg zip file has been saved.
    MSG

    private_constant :NAME_ERROR_MESSAGE, :PATH_ERROR_MESSAGE, :STANDARD_ERROR_MESSAGE
    ##
    # Creates a new object which represents an Anki SQLite3 database
    #
    # When passed a block:
    # - Yields execution to the block, and then after the block executes:
    #   - Zips the temporary database into a <name>.apkg file where <name> is the name argument
    #     - The destination directory is the current working directory by default
    #     - Or the directory argument (a relative file path is recommended)
    #   - Closes the temporary database and deletes the temporary database file (the *.anki21 file)
    # - If the block throws a runtime error:
    #   - Closes the temporary database and deletes the temporary database file
    #   - Does not create the zip file
    # When not passed a block:
    # - #zip_and_close must be called explicitly at the end of your script
    def initialize(name:, directory: Dir.pwd)
      setup_instance_variables(name: name, directory: directory)

      return unless block_given?

      begin
        yield self
      rescue StandardError => e
        close(destroy_temporary_files: true)
        puts_error_and_standard_message(error: e)
      else
        zip_and_close
      end
    end

    private

      def setup_instance_variables(name:, directory:)
        @name = check_name_is_valid(name: name)
        @directory = directory
        @tmp_files = []
        @anki21_database = setup_anki21_database_object
      end

      def check_name_is_valid(name:)
        raise ArgumentError, NAME_ERROR_MESSAGE unless name.instance_of?(String) && !name.empty? && !name.include?(" ")

        name
      end

      def setup_anki21_database_object
        random_file_name = "#{SecureRandom.hex(10)}.anki21"
        db = SQLite3::Database.new "#{@directory}/#{random_file_name}", options: {}
        @tmp_files << random_file_name
        db.execute_batch ANKI_SCHEMA_DEFINITION
        db
      end

      def puts_error_and_standard_message(error:)
        puts "#{error}\n#{STANDARD_ERROR_MESSAGE}"
      end

    public

    ##
    # Creates a new object which represents the Anki SQLite3 database file at path
    def self.open(path:, create_backup: true)
      setup_instance_variables_from_existing(path: path, create_backup: create_backup)

      return unless block_given?

      begin
        yield self
      rescue StandardError => e
        close(destroy_temporary_files: true)
        puts_error_and_standard_message(error: e)
      else
        eigen_zip_and_close
      end
    end

    class << self
      private

        def setup_instance_variables_from_existing(path:, create_backup:)
          @path = check_file_at_path_is_valid(path: path)
          copy_apkg_file if create_backup
          @tmp_files = []
          # @anki21_database = setup_anki21_database_object_from_existing
        end

        def check_file_at_path_is_valid(path:)
          raise PATH_ERROR_MESSAGE unless path.end_with?(".apkg") && File.exist?(path)

          path
        end

        def copy_apkg_file
          FileUtils.cp @path, "#{@path}.copy-#{Time.now.to_i}"
        end

        def setup_anki21_database_object_from_existing
          raise NotImplementedError
        end

        def eigen_zip_and_close
          raise NotImplementedError
        end
    end

    ##
    # Zips the database into a *.apkg file and closes the temporary database.
    # - With destroy_temporary_files: false, will not delete the temporary database file
    def zip_and_close(destroy_temporary_files: true)
      zip && close(destroy_temporary_files: destroy_temporary_files)
    end

    private

      def zip
        Zip::File.open(target_zip_file, create: true) do |zip_file|
          @tmp_files.each do |file_name|
            zip_file.add(file_name, File.join(@directory, file_name))
          end
        end
        true
      end

      def target_zip_file
        "#{@directory}/#{@name}.apkg"
      end

      def close(destroy_temporary_files:)
        destroy_tmp_files if destroy_temporary_files
        @anki21_database.close
      end

      def destroy_tmp_files
        @tmp_files.each { |file_name| File.delete("#{@directory}/#{file_name}") }
      end

    public

    ##
    # Returns true if the database is open
    def open?
      !closed?
    end

    ##
    # Returns true if the database is closed
    def closed?
      @anki21_database.closed?
    end
  end
end
