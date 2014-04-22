class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :body, null: false
      t.string :twitter_status_id, null: false, unique: true
      t.string :twitter_user_id, null: false

      t.timestamps
    end

    add_index :statuses, :twitter_status_id
  end
end
