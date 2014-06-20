class Product < ActiveRecord::Base
  belongs_to :node
  has_many :line_items
  has_many :pictures
  has_many :members, :through => :favorites
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :natures
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoriteable
  has_many :natures, :dependent => :destroy
  has_many :variants, :dependent => :destroy
  has_many :product_option_types, dependent: :destroy, inverse_of: :product
  has_many :option_types, through: :product_option_types

  validates :name, presence: true
  validates :price, presence: true
  validates :cost_price, presence: true
  validates :barcode, presence: true
  validates :node_id, presence: true

  scope :popular, -> { where(:favorites.count => 5) }

  def favorited_by_member?(member)
    return false if member.blank?
    self.members.include?(member)
  end

end
