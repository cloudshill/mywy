class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :product

  attr_accessor :uploader_secure_token
end
