class HallSeatsController < ApplicationController
  before_action :set_cinema, only: [:index]
  before_action :set_movie_hall, only: [:index]
  # GET /hallseats
  # GET /hallseats.json
  def index
    @show_time = ShowTime.find(params["show_time_id"])
    @hall_seats = @show_time.movie_hall.hall_seats.order("row ASC, col ASC")
  end

  private

  def hall_seat_params
    params.require(:hall_seat).permit(:row, :col)
  end

end
