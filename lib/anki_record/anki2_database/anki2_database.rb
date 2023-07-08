# frozen_string_literal: true

module AnkiRecord
  ##
  # Anki2Database represents the collection.anki2 Anki SQLite database
  class Anki2Database
    attr_reader :anki_package, :database

    FILENAME = "collection.anki2"

    def self.create_new(anki_package:)
      anki2_database = new
      anki2_database.create_initialize(anki_package:)
      anki2_database
    end

    def create_initialize(anki_package:)
      @anki_package = anki_package
      @database = SQLite3::Database.new("#{anki_package.tmpdir}/#{FILENAME}", options: {})
      database.execute_batch(ANKI_SCHEMA_DEFINITION)
      database.execute(INSERT_COLLECTION_ANKI_2_COL_RECORD)
      database.close
      database
    end

    def self.update_new(anki_package:)
      anki2_database = new
      anki2_database.update_initialize(anki_package:)
      anki2_database
    end

    def update_initialize(anki_package:)
      @anki_package = anki_package
      @database = SQLite3::Database.new("#{anki_package.tmpdir}/#{FILENAME}", options: {})
      database.close
      database
    end
  end
end
