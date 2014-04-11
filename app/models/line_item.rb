class LineItem < ActiveRecord::Base
	belongs_to :product
  belongs_to :member
  belongs_to :order
  belongs_to :line_itemable, polymorphic: true

  validates :amount, presence: true
  validates :line_itemable_id, presence: true
  validates :line_itemable_type, presence: true
  validates :member_id, presence: true
end
