require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password

  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :cats,
          class_name: "Cat",
          foreign_key: :user_id,
          primary_key: :id

  has_many :sessions

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token(user_agent)
    session = Session.create(
      user_id: self.id,
      token: SecureRandom::urlsafe_base64(16),
      user_agent: user_agent
    )
    session.token
  end

  def cleanup_sessions
    old_sessions = Session.where(user_id: self.id).where("sessions.created_at < ?", 7.days.ago)
    old_sessions.each(&:delete)
  end

end
