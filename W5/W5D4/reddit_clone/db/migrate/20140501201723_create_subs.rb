class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :name, null: false, unique: true
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :subs, :user_id
    add_index :subs, :name, unique: true
  end
end
