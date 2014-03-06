class MovieHallsController < ApplicationController
  before_filter :require_member, only: [:index, :new, :edit, :create, :update, :destroy]
  before_filter :require_cinema_owner, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_cinema, only: [:index, :new, :create]
  before_action :set_movie_hall, only: [:update]
  
  def index
    @movie_halls = @cinema.movie_halls
  end

  def new
    @movie_hall = MovieHall.new
  end

  def create
    @movie_hall = @cinema.movie_halls.build(movie_hall_params)

    respond_to do |format|
      if @movie_hall.save
        format.html { redirect_to cinema_movie_halls_path(@cinema), notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie_hall }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_hall.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  def update
    if not params[:pk].blank?
      if params[:update_attr] == "name"
        params[:movie_hall][:name] = params[:value]
      elsif params[:update_attr] == "rows"
        params[:movie_hall][:rows] = params[:value]
      elsif params[:update_attr] == "cols"
        params[:movie_hall][:cols] = params[:value]
      end
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
    params.require(:movie_hall).permit(:name, :rows, :cols)
  end
end