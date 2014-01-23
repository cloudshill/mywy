class Favorite < ActiveRecord::Base
	belongs_to :member
	belongs_to :product
end
