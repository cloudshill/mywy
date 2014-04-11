class Order < ActiveRecord::Base
	extend Enumerize

  enumerize :pay_method, in: [:offline, :online], default: :online
  enumerize :status,     in: [:paying, :delivering, :finished]

  belongs_to :member
  has_many :line_items

  validates :total_price, presence: true
  validates :address, presence: true
  validates :pay_method, presence: true
  validates :status, presence: true
  validates :member_id, presence: true
end
