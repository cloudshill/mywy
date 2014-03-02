class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :product

  validates :product_id, presence: true

  attr_accessor :uploader_secure_token
end
