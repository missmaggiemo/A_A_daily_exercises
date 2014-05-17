class List < ActiveRecord::Base

  validates :title, :board_id, presence: true

  belongs_to :board

end
