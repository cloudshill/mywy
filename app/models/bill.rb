class Bill < ActiveRecord::Base
  has_many :bill_items, as: :bill_itemable
end
