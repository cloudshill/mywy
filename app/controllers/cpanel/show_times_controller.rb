class Cpanel::ShowTimesController < Cpanel::ApplicationController
  before_action :set_cinema, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_time, only: [:show, :edit, :update, :destroy]

  def index
    @show_times = @cinema.show_times
  end

  def new
    @show_time = ShowTime.new
  end

  def create
    @show_time = @cinema.show_times.build(time_params)

    respond_to do |format|
      if @show_time.save
        format.html { redirect_to cpanel_cinema_show_times_path, notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_time }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_time.errors, status: :unprocessable_entity }
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

  def set_time
    @hall = ShowTime.find(params[:id])
  end

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id])
  end

  def time_params
    params.require(:show_time).permit(:cinema_id, :movie_id, :movie_hall_id, :show_time)
  end
end