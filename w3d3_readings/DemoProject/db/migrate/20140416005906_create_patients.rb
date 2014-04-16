class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.text :doctor_notes
      
      t.timestamps
    end
  end
end
