class AddDescriptionToSubs < ActiveRecord::Migration
  def change

    add_column :subs, :description, :text

  end
end
