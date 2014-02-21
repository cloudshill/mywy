class ShowTimesController < ApplicationController

  # GET /showtimes
  # GET /showtimes.json
  def index
    params[:day] ||= "today"
    if params[:day] == "today"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day)))
    elsif params[:day] == "tomorrow"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 216000)..(Date.current.end_of_day + 216000)))
    else
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 432000)..(Date.current.end_of_day + 432000)))
    end
    if not params[:cinema].blank?
      @show_times = @show_times.where(:cinema_id => params[:cinema].to_i)
    end
  end

end
