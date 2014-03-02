class Cinema < ActiveRecord::Base
  has_many :movie_halls
  has_many :show_times

  validates :name, presence: true
  validates :member_id, presence: true
end
