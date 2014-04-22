class Status < ActiveRecord::Base

  validates :twitter_status_id, uniqueness: true

  belongs_to :user, foreign_key: :twitter_user_id, primary_key: :twitter_user_id

  def self.get_by_twitter_user_id(user_id)
    if internet_connection?
      fetch_by_twitter_user_id!(user_id)
    else
      Status.where(twitter_user_id: user_id)
    end
  end

  def self.fetch_by_twitter_user_id!(user_id, options = {})

    if options[:just_posted]
      params = { user_id: user_id, count: 1 }
    else
      params = { user_id: user_id }
    end

    tweets_json = JSON.parse(TwitterSession.get(
      "statuses/user_timeline",
      params
    ))

    statuses = tweets_json.map do |tweet|
      json_to_status(tweet)
    end

    unless options[:just_posted]
      old_ids = Status.where(twitter_user_id: user_id).pluck(:twitter_status_id)
      to_save = statuses.select { |status| !old_ids.include?(status.twitter_status_id) }
    else
      to_save = statuses
    end
    to_save.each { |status| status.save! }

    statuses
  end

  def self.json_to_status(json_status)
    Status.new(
      body: json_status["text"],
      twitter_status_id: json_status["id_str"],
      twitter_user_id: json_status["user"]["id_str"]
    )
  end

  def self.post(body)
    path = "statuses/update"
    req_params = {
      status: body
    }
    TwitterSession.post(path, req_params)
    current_user_id = TwitterSession.access_token.params[:user_id]
    fetch_by_twitter_user_id!(current_user_id, just_posted: true)
  end

  private
  def self.internet_connection?
    begin
      true if open("http://www.twitter.com/")
    rescue
      false
    end
  end
end