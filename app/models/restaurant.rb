class Restaurant < ActiveRecord::Base
  belongs_to :member
  has_many :dinner_tables
  has_many :foods
  has_one :wechat, as: :wechatable
end