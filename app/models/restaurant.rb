class Restaurant < ActiveRecord::Base
  belongs_to :member
  has_many :dinner_tables
  has_many :foods
  has_many :favorites, as: :favoriteable
  has_one :wechat, as: :wechatable
  has_one :page, as: :pageable

  validates :name, presence: true
end
