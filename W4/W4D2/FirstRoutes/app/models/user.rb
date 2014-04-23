class User < ActiveRecord::Base
  validates :email, :name, :username, presence: true
  validates :username, uniqueness: true

  has_many(
    :contacts,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "Contact"
  )

  has_many(
    :contact_shares,
    :class_name => "ContactShare",
    :foreign_key => :user_id,
    :primary_key => :id)

  has_many(
    :shared_contacts,
    :through => :contact_shares,
    :source => :contact)

  has_many :groups
  has_many :notes, as: :notable


  def personal_favorites
    [].tap do |favorites|
      contacts.each do |contact|
        favorites << contact if contact.favorite
      end
    end
  end

  def shared_favorites
    [].tap do |favorites|
      contact_shares.each do |share|
        favorites << Contact.find(share.contact_id) if share.favorite
      end
    end
  end

  def favorites
    personal_favorites + shared_favorites
  end
end
