class Category < ActiveRecord::Base
  belongs_to :node
  belongs_to :parent, :class_name => "Category"
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  has_and_belongs_to_many :products

  scope :roots, -> { where(:parent_id => 0) }
end
