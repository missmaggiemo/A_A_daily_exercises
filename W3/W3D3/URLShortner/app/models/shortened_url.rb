class ShortenedUrl < ActiveRecord::Base

  validates :submitter_id, :presence => true
  validates :short_url, :uniqueness => true

  has_many(
    :taggings,
    :class_name => "Tagging",
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )

  has_many(
    :visitors,
    -> { distinct },
    :through => :visits,
    :source => :user,
  )

  has_many(
    :tag_topics,
    :through => :taggings,
    :source => :shortened_url
  )


  def self.random_code
    code = SecureRandom.urlsafe_base64
    while self.pluck(:short_url).include?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    new_url = self.new(
      :submitter_id => user.id,
      :long_url => long_url,
      :short_url => self.random_code
      )
    new_url.save!
    new_url
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques(time_value) # like 10.minutes.ago
    self.visits.select do |visit|
      visit.created_at > time_value
    end.count
  end

end