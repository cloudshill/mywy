class ShowTime < ActiveRecord::Base
  belongs_to :cinema
  belongs_to :movie
  belongs_to :movie_hall
end
