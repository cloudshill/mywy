class Ticket < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:paying, :finished]
  enumerize :channel, in: [:shop, :website], :default => :website

  belongs_to :member
  belongs_to :cinema
  belongs_to :movie
  belongs_to :hall_seat
  belongs_to :show_time

  has_many :line_items, as: :goodsable

  validates :member_id, presence: true
  validates :cinema_id, presence: true
  validates :movie_id, presence: true
  validates :show_time_id, presence: true
  validates :hall_seat_id, presence: true
end
