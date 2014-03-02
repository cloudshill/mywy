class ShowTime < ActiveRecord::Base
  belongs_to :cinema
  belongs_to :movie
  belongs_to :movie_hall

  validates :cinema_id, presence: true
  validates :movie_id, presence: true
  validates :movie_hall_id, presence: true
  validates :show_time, presence: true
  validates :price, presence: true
end
