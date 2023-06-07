# frozen_string_literal: true

module AnkiRecord
  ##
  # Module with the Anki21Database class's attribute readers, writers, and accessors.
  module Anki21DatabaseConstructor
    FILENAME = "collection.anki21"

    def initialize(anki_package:)
      @anki_package = anki_package
      @database = SQLite3::Database.new "#{anki_package.tmpdir}/#{FILENAME}", options: {}
      database.execute_batch ANKI_SCHEMA_DEFINITION
      database.execute INSERT_COLLECTION_ANKI_21_COL_RECORD
      database.results_as_hash = true
      @collection = Collection.new(anki21_database: self)
      initialize_note_types
      initialize_deck_options_groups
      initialize_decks
    end

    private

      def initialize_note_types
        @note_types = []
        JSON.parse(col_record["models"]).values.map do |model_hash|
          NoteType.new(anki21_database: self, args: model_hash)
        end
      end

      def initialize_decks
        @decks = []
        JSON.parse(col_record["decks"]).values.map do |deck_hash|
          Deck.new(anki21_database: self, args: deck_hash)
        end
      end

      def initialize_deck_options_groups
        @deck_options_groups = []
        JSON.parse(col_record["dconf"]).values.map do |dconf_hash|
          DeckOptionsGroup.new(anki21_database: self, args: dconf_hash)
        end
      end
  end
end
