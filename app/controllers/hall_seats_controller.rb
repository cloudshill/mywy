class HallSeatsController < ApplicationController
  before_action :set_cinema, only: [:index]
  before_action :set_movie_hall, only: [:index]
  before_action :set_hall_seat, only: [:update, :destroy]
  # GET /hallseats
  # GET /hallseats.json
  def index
    params["show_time_id"] ||= 0;
    if params["show_time_id"] == 0
      @hall_seats = @movie_hall.hall_seats
    else
      @show_time = ShowTime.find(params["show_time_id"])
      @hall_seats = @show_time.movie_hall.hall_seats.order("row ASC, col ASC")
    end
  end

  def edit
    
  end

  def update
    if not params[:pk].blank?
      if not params[:hall_seat][:row].blank?
        params[:hall_seat][:row] = params[:value].to_i
      end
      if not params[:hall_seat][:col].blank?
        params[:hall_seat][:col] = params[:value].to_i
      end
    end
    respond_to do |format|
      if @hall_seat.update(hall_seat_params)
        format.json { head :no_content }
      else
        format.json { render json: @hall_seat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hall_seat.destroy
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  private

  def set_hall_seat
    @hall_seat = HallSeat.find(params[:id])
  end

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id]) if not params[:cinema_id].blank?
  end

  def set_movie_hall
    @movie_hall = MovieHall.find(params[:movie_hall_id]) if not params[:movie_hall_id].blank?
  end

  def hall_seat_params
    params.require(:hall_seat).permit(:row, :col)
  end

end
