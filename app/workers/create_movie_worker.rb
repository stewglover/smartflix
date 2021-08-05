class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(title)
    movie_params = CreateMovie::ByTitle.call(title: title)

    Movie.create(movie_params)
  end
end
