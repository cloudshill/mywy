class Node < ActiveRecord::Base
  extend Enumerize
  enumerize :business_scope, in: [:mywy, :restaurant], default: :mywy

	has_many :categories, :dependent => :destroy
  has_many :products
  has_many :foods

  validates :name, presence: true
end
