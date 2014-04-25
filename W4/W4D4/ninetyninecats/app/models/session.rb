class Session < ActiveRecord::Base
  validates :user_id, :token, presence: true
  belongs_to :user

end
