class Product < ActiveRecord::Base
  belongs_to :node
  has_many :line_items
  has_many :members_have_cart, :through => :line_items, :source => :members
  has_many :pictures
  has_many :favorites
  has_many :members, :through => :favorites
  has_and_belongs_to_many :categories
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoriteable

  validates :name, presence: true
  validates :price, presence: true
  validates :inprice, presence: true
  validates :barcode, presence: true
  validates :node_id, presence: true

  def favorited_by_member?(member)
    return false if member.blank?
    self.members.include?(member)
  end

  def quantity_in_cart(member)
    return 0 if member.blank?
    self.line_items.where("member_id = ? AND order_id IS NULL", member.id).first.amount
  end

  def belongs_to_line_item(member)
    return nil if member.blank?
    self.line_items.where("member_id = ? AND order_id IS NULL", member.id).first
  end
end
