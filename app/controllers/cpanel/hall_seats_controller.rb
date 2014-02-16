class Cpanel::HallSeatsController < Cpanel::ApplicationController
  before_action :set_seat, only: [:show, :edit, :update, :destroy]
  before_action :set_cinema, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_hall, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @hall_seats = @movie_hall.hall_seats
  end

  def new
    @hall_seat = HallSeat.new
  end

  def create
    @hall_seat = @movie_hall.hall_seats.build(seat_params)

    respond_to do |format|
      if @hall_seat.save
        format.html { redirect_to cpanel_cinema_movie_hall_hall_seats_path, notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hall_seat }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @hall_seat.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  private

  def set_seat
  	@seat = HallSeat.find(params[:id])
  end

  def set_hall
    @movie_hall = MovieHall.find(params[:movie_hall_id])
  end

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id])
  end

  def seat_params
  	params.require(:hall_seat).permit(:hall_id, :row, :col)
  end
end