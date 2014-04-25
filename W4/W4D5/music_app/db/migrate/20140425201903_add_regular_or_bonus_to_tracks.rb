class AddRegularOrBonusToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :bonus, :boolean, default: false
  end
end
