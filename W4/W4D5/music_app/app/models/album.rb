class Album < ActiveRecord::Base
  
  validates :title, :band_id, presence: true
  has_many :tracks, dependent: :destroy
  belongs_to :band
  
end
