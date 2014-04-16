class RemoveDoctorNotesFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :doctor_notes
  end
end
