class Session < ActiveRecord::Base
  
  validates :user_id, :token, presence: true
  
  belongs_to :user
  
  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def self.clean_up_sessions
    Session.all.each do |old_session|
      old_session.delete if old_session.created_at > 7.days.ago
    end
  end
  
end
