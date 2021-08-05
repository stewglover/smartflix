require 'httparty'
require 'dotenv'
Dotenv.load

module CreateMovie
  class ByTitle < ApplicationService

    def initialize(title:)
      super()
      @title = title
    end

    def call
      movie_hash = generate_movie_hash
      unless movie_hash[:response] == 'True'
        log_error(movie_hash[:error])
      end
      movie_hash
    end

    private

    attr_reader :title

    EXCLUDED_KEYS = %i[ratings type].freeze

    def parse(object)
      object.transform_keys(&:underscore).symbolize_keys.except!(*EXCLUDED_KEYS)
    end

    def generate_movie_hash
      parse(HTTParty.get("#{base_uri}t=#{title}"))
    end

    def log_error(error)
      Rails.logger.warn("#{title}: #{error}")
    end
  end
end
