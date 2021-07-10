module Apis
  module Omdb
    class Base
      include HTTParty

      base_uri 'http://www.omdbapi.com/'

      default_params api_key: ENV['OMDB_API']

      headers 'Content-Type' => 'application/json'

      def call
        raise NoMethodError, :call
      end
    end
  end
end
