class FriendCircleMembership < ActiveRecord::Base

  validates :member, :friend_circle, presence: true

  belongs_to :friend_circle, inverse_of: :memberships

  belongs_to :member, class_name: "User", foreign_key: :member_id

  has_one :owner, through: :friend_circle, source: :user

end
