class ContactShare < ActiveRecord::Base
  validate :check_contact_info_against_user_info

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id)

  belongs_to(
    :contact,
    class_name: "Contact",
    foreign_key: :contact_id,
    primary_key: :id)

  has_many :notes, as: :notable

  def check_contact_info_against_user_info
    if Contact.find(contact_id).email == User.find(user_id).email
      errors.add(:contact_info, "can't be shared with the user with same info")
    end
  end

end