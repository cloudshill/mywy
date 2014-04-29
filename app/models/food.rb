class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :images, as: :imageable
  has_many :favorites, as: :favoriteable
  has_many :line_items, as: :itemable
  has_many :bill_items, as: :bill_itemable
  has_many :comments, as: :commentable
end
