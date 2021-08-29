class AddSeasonRecordsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :season_records, :jsonb
  end
end
