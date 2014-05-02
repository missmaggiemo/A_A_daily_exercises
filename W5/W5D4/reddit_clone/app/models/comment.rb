class Comment < ActiveRecord::Base
  validates :body, :user_id, :link_id, presence: true

  belongs_to :link
  belongs_to :user

  def parent
    return nil if self.parent_comment_id.nil?
    Comment.find(parent_comment_id)
  end

end
