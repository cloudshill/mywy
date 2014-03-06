class HallSeat < ActiveRecord::Base
  belongs_to :movie_hall

  validates :movie_hall_id, presence: true
  validates :row, presence: true
  validates :col, presence: true

  def booking?(show_time_id)
    ticket = Ticket.where("show_time_id = ? AND hall_seat_id = ?", show_time_id, self.id).first
    !ticket.blank?
  end
  
end
