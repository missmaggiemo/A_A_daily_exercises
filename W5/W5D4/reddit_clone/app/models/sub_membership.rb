class SubMembership < ActiveRecord::Base

  validates :sub_id, :link_id, presence: true

  validates :link_id, uniqueness: { scope: :sub_id }

  belongs_to :link
  belongs_to :sub

end
