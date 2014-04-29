class Bill < ActiveRecord::Base
  has_many :bill_items
  belongs_to :billable, polymorphic: true
  belongs_to :table, :class_name => "DinnerTable", :foreign_key => :table_id

  validates :table_id, presence: true
end
