class Favorite < ActiveRecord::Base
	belongs_to :member
	belongs_to :favoriteable, polymorphic: true

  validates :member_id, presence: true
  validates :favoriteable_id, presence: true
  validates :favoriteable_type, presence: true

  before_create :fix_favoriteable_id
  def fix_favoriteable_id
    self.favoriteable_id = self.favoriteable_id.to_i
  end
end
