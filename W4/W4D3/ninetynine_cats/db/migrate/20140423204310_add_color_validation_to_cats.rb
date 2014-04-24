class AddColorValidationToCats < ActiveRecord::Migration
  def change
    change_column :cats, :color, :string, null: false
  end
end
