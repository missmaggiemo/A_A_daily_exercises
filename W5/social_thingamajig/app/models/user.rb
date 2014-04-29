class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }

  has_many :sessions
  has_many :posts
  has_many :friend_circles, inverse_of: :user

  has_many :circle_memberships, :class_name => "FriendCircleMembership", :foreign_key => :member_id
  has_many :shared_circles, :through => :circle_memberships, :source => :friend_circle
  has_many :shared_posts, :through => :shared_circles, :source => :posts

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.is_password?(password)
  end

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text)
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

end
