class Order < ActiveRecord::Base
	extend Enumerize

  enumerize :pay_method, in: [:cod, :alipay, :unionpay]
  enumerize :status,     in: [:paying, :delivering, :finished]

  belongs_to :member
  has_many :line_items
  has_many :products, :through => :line_items
end
