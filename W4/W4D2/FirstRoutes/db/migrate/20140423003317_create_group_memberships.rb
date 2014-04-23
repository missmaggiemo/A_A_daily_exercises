class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :contact_id
      t.integer :group_id

      t.timestamps
    end
  end
end
