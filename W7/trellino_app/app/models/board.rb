class Board < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  has_many :lists

end
