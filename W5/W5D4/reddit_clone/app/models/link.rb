class Link < ActiveRecord::Base

  validates :title, :url, :user_id, presence: true

  validate :unique_as_of_thirty_mins_ago

  belongs_to :user

  has_many :sub_memberships

  has_many :subs, through: :sub_memberships, source: :sub

  has_many :comments

  private

  def unique_as_of_thirty_mins_ago
    if self.class.where("created_at > ?", 30.minutes.ago).map(&:url).include?(self.url)
      self.errors.add(:url, "has already been uploaded recently")
    end
  end

end
