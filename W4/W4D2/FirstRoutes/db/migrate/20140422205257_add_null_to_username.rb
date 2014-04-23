class AddNullToUsername < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, column_options: {null: false}
  end
end
