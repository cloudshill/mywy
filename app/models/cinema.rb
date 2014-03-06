class Cinema < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader

  has_many :movie_halls
  has_many :show_times

  validates :name, presence: true
  validates :member_id, presence: true

  attr_accessor :uploader_secure_token
end
