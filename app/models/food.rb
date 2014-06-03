class Food < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :node
  has_many :images, as: :imageable
  has_many :favorites, as: :favoriteable
  has_many :bill_items
  has_many :comments, as: :commentable
end
