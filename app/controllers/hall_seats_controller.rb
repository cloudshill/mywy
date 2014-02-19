class HallSeatsController < ApplicationController

  # GET /hallseats
  # GET /hallseats.json
  def index
    params["show_time_id"] ||= 0;
    @show_time = ShowTime.find(params["show_time_id"])
    @hall_seats = @show_time.movie_hall.hall_seats.order("row ASC, col ASC")
  end

end
