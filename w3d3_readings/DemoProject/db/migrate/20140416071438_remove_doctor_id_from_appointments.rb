class RemoveDoctorIdFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :doctor_id
  end
end
