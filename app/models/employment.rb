class Employment < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:apply, :work], default: :apply

  belongs_to :member
  belongs_to :employmentable, polymorphic: true
  belongs_to :cinema, :foreign_key => :employmentable_id, :class_name => "Cinema"

  validates :member_id, presence: true
  validates :employmentable_id, presence: true
  validates :employmentable_type, presence: true

  before_create :fix_employmentable_id
  def fix_employmentable_id
    self.employmentable_id = self.employmentable_id.to_i
  end
end
