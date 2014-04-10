class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :images, as: :imageable
  has_many :favorites, as: :favoriteable
end
