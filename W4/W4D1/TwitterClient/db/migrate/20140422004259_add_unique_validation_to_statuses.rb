class AddUniqueValidationToStatuses < ActiveRecord::Migration
  def change
    remove_index :statuses, :twitter_status_id
    add_index :statuses, :twitter_status_id, unique: true
  end
end
