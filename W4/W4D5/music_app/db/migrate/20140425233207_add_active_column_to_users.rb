class AddActiveColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean, default: false
    add_column :users, :activate_token, :string
    add_index :users, [:id, :activate_token], unique: true
  end
end
