class Physician < ActiveRecord::Base
  has_many(
      :appointments,
      :class_name => "Appointment",
      :foreign_key => :physician_id,
      :primary_key => :id
    )
  has_many :patients, :through => :appointments, :source => :patient
  
end
