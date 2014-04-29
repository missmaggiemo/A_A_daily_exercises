class PostShare < ActiveRecord::Base
  validates :post, :friend_circle, :presence => true

  belongs_to :post, :inverse_of => :post_shares
  belongs_to :friend_circle, :inverse_of => :post_shares

end
