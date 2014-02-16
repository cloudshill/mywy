class MovieHall < ActiveRecord::Base
  belongs_to :cinema
  has_many :hall_seats
  has_many :show_times
end
