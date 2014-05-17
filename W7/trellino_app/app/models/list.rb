class List < ActiveRecord::Base

  validates :title, :board_id, presence: true

  belongs_to :board
  
  has_many :cards

end
