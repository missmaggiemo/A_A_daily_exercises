class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :location_city
      t.string :location_state
      t.integer :years_of_experience
      t.string :med_school
      t.string :specialty

      t.timestamps
    end
  end
end
