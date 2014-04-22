class User < ActiveRecord::Base
  validate :screen_name, presence: true
  validate :twitter_user_id, presence: true, uniqueness: true

  has_many :statuses, foreign_key: :twitter_user_id, primary_key: :twitter_user_id


  def self.get_by_screen_name(screen_name)
    user = User.find_by_screen_name(screen_name)
    if user
      user
    else
      fetch_by_screen_name!(screen_name)
    end
  end

  def fetch_statuses!
    Status.fetch_by_twitter_user_id!(self.twitter_user_id)
  end

  private
  def self.fetch_by_screen_name!(screen_name)
    json_user = JSON.parse(TwitterSession.get("users/show", screen_name: screen_name))
    User.new(
      screen_name: json_user["screen_name"],
      twitter_user_id: json_user["id_str"]
    ).save!
  end
end
