class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :imageable, polymorphic: true

  validates :member_id, presence: true
  validates :imageable_id, presence: true
  validates :imageable_type, presence: true

  attr_accessor :uploader_secure_token

  before_create :fix_imageable_id
  def fix_imageable_id
    self.imageable_id = self.imageable_id.to_i
  end
end
