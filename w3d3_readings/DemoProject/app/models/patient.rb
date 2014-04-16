class Patient < ActiveRecord::Base
  has_many(
      :appointments,
      :class_name => "Appointment",
      :foreign_key => :patient_id,
      :primary_key => :id
    )
    
  has_many :physicians, :through => :appointments, :source => :physician
  
  
end
