class Node < ActiveRecord::Base
	has_many :categories, :dependent => :destroy
  has_many :products

  validates :name, presence: true
end
