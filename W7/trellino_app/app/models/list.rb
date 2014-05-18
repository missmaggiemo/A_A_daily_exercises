class List < ActiveRecord::Base

  validates :title, :board_id, presence: true

  belongs_to :board
  
  def cards
    Card.where(list_id: self.id).order(:sort_id)
  end


end
