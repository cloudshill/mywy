class Manage::Cinema::TicketsController < Manage::ApplicationController
  before_filter :require_member
  before_action :set_cinema, only: [:index, :new, :create]

  def index
    @tickets = current_member.tickets
  end

  def new
    @show_times = ShowTime.all.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day))).where(:cinema_id => params[:cinema_id].to_i)
  end

  def create
    params[:seats].each do |seat|
      @ticket = current_member.tickets.build(ticket_params)
      @ticket.hall_seat_id = seat.to_i
      @ticket.save
    end
    respond_to do |format|
      format.html { redirect_to manage_cinema_cinema_tickets_path, notice: '出票成功!' }
    end
  end

  private

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id])
  end

  def ticket_params
    params.require(:ticket).permit(:movie_id, :show_time_id, :cinema_id, :movie_hall_id, :hall_seat_id)
  end
end
