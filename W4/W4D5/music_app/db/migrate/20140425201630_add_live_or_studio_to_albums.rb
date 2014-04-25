class AddLiveOrStudioToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :live, :boolean, default: false
  end
end
