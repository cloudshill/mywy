class Ticket < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:paying, :finished]
  enumerize :channel, in: [:shop, :website], :default => :website

  belongs_to :member
  belongs_to :cinema
  belongs_to :movie
  belongs_to :hall_seat
end
