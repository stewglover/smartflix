class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(title)
    sleep 1

    movie_params = CreateMovie::ByTitle.call(title)

    Movie.create(movie_params)
  end
end
