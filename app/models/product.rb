class Product < ActiveRecord::Base
  belongs_to :node
  has_many :line_items, as: :line_itemable
  has_many :pictures
  has_many :members, :through => :favorites
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :natures
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

end
