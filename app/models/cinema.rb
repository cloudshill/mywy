class Cinema < ActiveRecord::Base
  has_many :movie_halls
  has_many :show_times
end
