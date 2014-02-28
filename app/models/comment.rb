class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :commentable, polymorphic: true

  before_create :fix_commentable_id
  def fix_commentable_id
    self.commentable_id = self.commentable_id.to_i
  end
end
