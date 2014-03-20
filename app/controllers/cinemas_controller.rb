class CinemasController < ApplicationController
  before_filter :require_member, only: [:index]
  before_filter :require_cinema_owner_or_employee, only: [:index]
  before_action :set_cinema, only: [:show, :employment, :comments]

  layout "cinema", only: [:show, :employment, :comments]

  # GET /cinemas
  # GET /cinemas.json
  def index
    @cinemas = Cinema.all
  end

  # GET /cinemas/1
  # GET /cinemas/1.json
  def show
    @show_times_today = @cinema.show_times.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day))).order("show_time ASC")
    @show_times_tomorrow = @cinema.show_times.where(:show_time => ((Date.current.beginning_of_day + 216000)..(Date.current.end_of_day + 216000))).order("show_time ASC")
  end

  def employment
    @employment = Employment.new
  end

  def comments
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cinema_params
      params.require(:cinema).permit(:name, :avatar, :guide)
    end
end
