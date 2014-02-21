class Ticket < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:paying, :finished]

  belongs_to :member
  belongs_to :cinema
  belongs_to :movie
  belongs_to :hall_seat
end
