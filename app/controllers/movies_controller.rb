class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  # GET /movie/movies
  # GET /movie/movies.json
  def index
    @movies = Movie.all
  end

  # GET /movie/movies/1
  # GET /movie/movies/1.json
  def show
    @show_times = @movie.show_times.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day)))
    @cinemas = Cinema.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover)
    end
end
