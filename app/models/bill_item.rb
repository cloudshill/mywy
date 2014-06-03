class BillItem < ActiveRecord::Base
  belongs_to :food
  belongs_to :bill

  validates :food_id, presence: true
  validates :bill_id, presence: true
  validates :quantity, presence: true
end
