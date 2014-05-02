class CreateSubMemberships < ActiveRecord::Migration
  def change
    create_table :sub_memberships do |t|
      t.integer :sub_id, null: false
      t.integer :link_id, null: false

      t.timestamps
    end

    add_index :sub_memberships, :sub_id
    add_index :sub_memberships, :link_id
    add_index :sub_memberships, [:link_id, :sub_id], unique: true
  end
end
