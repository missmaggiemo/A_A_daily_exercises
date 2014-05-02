class Sub < ActiveRecord::Base
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true

  belongs_to :moderator,
  class_name: "User",
  foreign_key: :user_id

  has_many :sub_memberships

  has_many :links, through: :sub_memberships, source: :link

end
