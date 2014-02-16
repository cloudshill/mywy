class Cpanel::MovieHallsController < Cpanel::ApplicationController
  before_action :set_cinema, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_hall, only: [:show, :edit, :update, :destroy]

  def index
  	@movie_halls = @cinema.movie_halls
  end

  def new
  	@movie_hall = MovieHall.new
  end

  def create
  	@movie_hall = @cinema.movie_halls.build(hall_params)

  	respond_to do |format|
      if @movie_hall.save
        format.html { redirect_to cpanel_cinema_movie_halls_path, notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie_hall }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_hall.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
  	end
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  private

  def set_hall
  	@hall = MovieHall.find(params[:id])
  end

  def set_cinema
  	@cinema = Cinema.find(params[:cinema_id])
  end

  def hall_params
  	params.require(:movie_hall).permit(:name, :cinema_id)
  end
end