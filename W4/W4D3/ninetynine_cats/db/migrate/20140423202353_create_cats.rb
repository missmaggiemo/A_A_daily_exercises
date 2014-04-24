class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age, null: false
      t.string :birth_date
      t.string :color
      t.string :name, null: false
      t.string :sex, null: false

      t.timestamps
    end
  end
end
