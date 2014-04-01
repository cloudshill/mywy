class Node < ActiveRecord::Base
  extend Enumerize
  enumerize :business_scope, in: [:mywy, :restaurant], default: :mywy

	has_many :categories, :dependent => :destroy
  has_many :products

  validates :name, presence: true
end
