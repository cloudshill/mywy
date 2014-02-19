class ShowTimesController < ApplicationController

  # GET /showtimes
  # GET /showtimes.json
  def index
    params[:day] ||= "today"
    if params[:day] == "today"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day)))
    elsif params[:day] == "tomorrow"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 1)..(Date.current.end_of_day + 1)))
    else
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 2)..(Date.current.end_of_day + 2)))
    end
  end

end
