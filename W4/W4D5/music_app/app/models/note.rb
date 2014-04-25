class Note < ActiveRecord::Base
  validates :track_id, :user_id, :body, presence: true
  belongs_to :track
  belongs_to :user
    
  def band
    self.track.band
  end
  
  def album
    self.track.album
  end
  
end
