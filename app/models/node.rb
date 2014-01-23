class Node < ActiveRecord::Base
	has_many :categories, :dependent => :destroy
  has_many :products
end
