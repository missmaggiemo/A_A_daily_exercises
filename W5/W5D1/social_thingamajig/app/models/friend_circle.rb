class FriendCircle < ActiveRecord::Base
  validates :user_id, :title, presence: true

  belongs_to :user, inverse_of: :friend_circles

  has_many :memberships, class_name: "FriendCircleMembership", foreign_key: :friend_circle_id, inverse_of: :friend_circle

  has_many :members, through: :memberships, source: :member

  has_many :post_shares, :inverse_of => :friend_circle

  has_many :posts, :through => :post_shares, :source => :post
end
