class ChangeBirthDateAllowNull2 < ActiveRecord::Migration
  def change
    change_column :cats, :birth_date, :date, null: true
  end
end
