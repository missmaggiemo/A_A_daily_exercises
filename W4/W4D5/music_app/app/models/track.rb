class Track < ActiveRecord::Base
  
  validates :title, :album_id, presence: true
  
  belongs_to :album
    
  has_many :notes
  
  def band
    self.album.band
  end
  
end
