class ApplicationService
  def self.call(...)
    new(...).call
  end

  def base_uri
    "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&"
  end
end
