class Link < ActiveRecord::Base
  validates :url, :title, :post, :presence => true

  belongs_to :post, :inverse_of => :links

end
