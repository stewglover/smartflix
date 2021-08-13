class MoviesController < ApplicationController
  def show
    @movie = Movie.find_by(title: params[:title])

    if @movie
      render json: @movie
    else
      CreateMovieWorker.perform_async(params[:title])
      render json: { error: 'Sorry, not found'}.to_json, status: :not_found
    end
  end
end
