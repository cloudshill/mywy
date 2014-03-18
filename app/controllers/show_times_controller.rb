class ShowTimesController < ApplicationController
  before_filter :require_member, only: [:new, :edit, :create, :update, :destroy, :order]
  before_filter :require_cinema_owner_or_employee, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_cinema, only: [:index, :new, :create, :order]
  # GET /showtimes
  # GET /showtimes.json
  def index
    params[:day] ||= "today"
    if params[:day] == "today"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day)))
    elsif params[:day] == "tomorrow"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 216000)..(Date.current.end_of_day + 216000)))
    elsif params[:day] == "last"
      @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day + 432000)..(Date.current.end_of_day + 432000)))
    end
    if not params[:cinema].blank?
      @show_times = @show_times.where(:cinema_id => params[:cinema].to_i)
    end
    if not params[:movie].blank?
      @show_times = @show_times.where(:movie_id => params[:movie].to_i)
    end
  end

  def new
    @show_time = ShowTime.new
  end

  def order
    @show_time = ShowTime.find(params[:id])
    @movie_hall = @show_time.movie_hall
    @hall_seats = @movie_hall.hall_seats.order("row ASC, col ASC")
  end

  def create
    @show_time = @cinema.show_times.build(show_time_params)

    respond_to do |format|
      if @show_time.save
        format.html { redirect_to cinema_show_times_path(@cinema), notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_time }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_time.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  private

  def set_cinema
    if not params[:cinema_id].blank?
      @cinema = Cinema.find(params[:cinema_id])
    end
  end

  def show_time_params
    params.require(:show_time).permit(:cinema_id, :movie_id, :movie_hall_id, :show_time, :price, :technology)
  end

end
