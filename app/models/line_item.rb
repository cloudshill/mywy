class LineItem < ActiveRecord::Base
	belongs_to :product
  belongs_to :member
  belongs_to :order

  validates :amount, presence: true
  validates :product_id, presence: true
  validates :member_id, presence: true
end
