class User < ActiveRecord::Base

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :moderated_subs,
  class_name: "Sub",
  foreign_key: :user_id

  has_many :comments

  def password
    self.password_digest
  end

  def password=(plain_text)
    if plain_text.empty?
      errors.add(:password, "can't be empty")
    elsif plain_text.length < 6
      errors.add(:password, "is too short")
    else
      self.password_digest = BCrypt::Password.create(plain_text)
    end
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end


  def reset_session_token
    self.update(session_token: SecureRandom::urlsafe_base64(16))
    self.session_token
  end

  def self.find_by_credentials(user_params)
    user = self.find_by(email: user_params[:email])
    return user if user && user.is_password?(user_params[:password])
  end

end
