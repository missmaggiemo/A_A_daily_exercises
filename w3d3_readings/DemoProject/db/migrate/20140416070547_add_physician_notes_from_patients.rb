class AddPhysicianNotesFromPatients < ActiveRecord::Migration
  def change
    add_column :patients, :physician_notes, :text
  end
end
