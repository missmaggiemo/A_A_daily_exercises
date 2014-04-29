class Session < ActiveRecord::Base
  validates :user_id, :token, :presence => true

  belongs_to :user

  def self.generate_session_token(user)
    current_session = Session.create(:user_id => user.id, :token => SecureRandom::urlsafe_base64(16))
    current_session.token
  end
end
