class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true
  validates_uniqueness_of :email, :scope => :user_id

  belongs_to(
    :user,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  has_many(
    :contact_shares,
    :class_name => "ContactShare",
    :foreign_key => :contact_id,
    :primary_key => :id)

  has_many(
    :shared_users,
    :through => :contact_shares,
    :source => :user)

  has_many :notes, as: :notable

  def self.contacts_for_user_id(user_id)
    contact_results = Contact.select("*").joins(<<-SQL)
    LEFT OUTER JOIN
    contact_shares
    ON
    contacts.id = contact_shares.contact_id
    WHERE
    contacts.user_id = #{user_id} OR contact_shares.user_id = #{user_id}
    SQL
  end

end
