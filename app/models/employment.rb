class Employment < ActiveRecord::Base
  belongs_to :member
  belongs_to :employmentable, polymorphic: true

  validates :member_id, presence: true
  validates :employmentable_id, presence: true
  validates :employmentable_type, presence: true

  before_create :fix_employmentable_id
  def fix_employmentable_id
    self.employmentable_id = self.employmentable_id.to_i
  end
end
