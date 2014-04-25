class User < ActiveRecord::Base
  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  
  has_many :sessions
  has_many :notes
  
  def password
    self.password_digest
  end
  
  def password=(plain_text)
    self.password_digest = BCrypt::Password.create(plain_text)
  end
  
  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end
  
  def self.find_by_credentials(user_params)
    if user_params['username'].empty? && user_params['email'].empty?
      raise "Need either email or username to log in!"
    else
      if user_params['username'].empty?
        User.find_by_email(user_params['email'])
      else
        User.find_by_username(user_params['username'])
      end
    end
  end
  
end
