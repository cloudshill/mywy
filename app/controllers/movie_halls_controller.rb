class MovieHallsController < ApplicationController
  before_action :set_cinema, only: [:index]
  before_action :set_movie_hall, only: [:update]
  
  def index
    @movie_halls = @cinema.movie_halls
  end

  def update
    if not params[:pk].blank?
      params[:movie_hall][:name] = params[:value]
    end
    respond_to do |format|
      if @movie_hall.update(movie_hall_params)
        format.json { head :no_content }
      else
        format.json { render json: @movie_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id])
  end

  def set_movie_hall
    @movie_hall = MovieHall.find(params[:id])
  end

  def movie_hall_params
    params.require(:movie_hall).permit(:name)
  end
end