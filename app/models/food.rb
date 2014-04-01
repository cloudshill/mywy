class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :images, as: :imageable
end
