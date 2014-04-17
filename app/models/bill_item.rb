class BillItem < ActiveRecord::Base
  belongs_to :bill_itemable, polymorphic: true

  validates :bill_itemable_id, presence: true
  validates :bill_itemable_type, presence: true

  before_create :fix_bill_itemable_id
  def fix_bill_itemable_id
    self.bill_itemable_id = self.bill_itemable_id.to_i
  end
end
