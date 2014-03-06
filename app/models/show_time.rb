class ShowTime < ActiveRecord::Base
  extend Enumerize
  serialize :technology, Array
  enumerize :technology, in: ["2D", "3D", "4D"], default: "2D"

  belongs_to :cinema
  belongs_to :movie
  belongs_to :movie_hall

  validates :cinema_id, presence: true
  validates :movie_id, presence: true
  validates :movie_hall_id, presence: true
  validates :show_time, presence: true
  validates :price, presence: true
end
