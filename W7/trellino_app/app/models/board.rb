class Board < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  
  def lists
    List.where(board_id: self.id).order(:sort_id)
  end


end
