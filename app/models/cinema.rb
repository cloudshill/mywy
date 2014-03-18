class Cinema < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader

  belongs_to :member

  has_many :movie_halls
  has_many :show_times

  has_many :employments, as: :employmentable
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :member_id, presence: true

  attr_accessor :uploader_secure_token
end
