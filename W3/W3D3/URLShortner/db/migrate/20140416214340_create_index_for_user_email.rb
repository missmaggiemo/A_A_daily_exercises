class CreateIndexForUserEmail < ActiveRecord::Migration
  def change
    add_index :users, :email
  end
end
