class Post < ActiveRecord::Base
  validates :user, :title, :body, :presence => true

  belongs_to :user
  has_many :post_shares, :inverse_of => :post
  has_many :links, :inverse_of => :post, :dependent => :destroy

  has_many :circles, through: :post_shares, source: :friend_circle

end
