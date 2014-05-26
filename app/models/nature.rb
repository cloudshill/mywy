class Nature < ActiveRecord::Base
  belongs_to :node
  belongs_to :parent, :class_name => "Nature"
  has_many :children, :class_name => "Nature", :foreign_key => "parent_id", :dependent => :destroy
  has_and_belongs_to_many :products

  validates :name, presence: true
  validates :node_id, presence: true

  scope :roots, -> { where(:parent_id => 0) }
end
