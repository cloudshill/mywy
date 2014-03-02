class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true
  validates :member_id, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true

  before_create :fix_commentable_id
  def fix_commentable_id
    self.commentable_id = self.commentable_id.to_i
  end
end
