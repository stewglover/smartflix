require 'httparty'
require 'dotenv'
Dotenv.load

module CreateMovie
  BASE_URI = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&".freeze
  class ByTitle < ApplicationService

    def initialize(title)
      @title = title
    end

    def call
      parse(HTTParty.get("#{BASE_URI}t=#{@title}"))
    end

    private

    EXCLUDED_KEYS = %i[response ratings type].freeze

    def parse(object)
      object.transform_keys(&:underscore).symbolize_keys.except!(*EXCLUDED_KEYS)
    end

  end
end
