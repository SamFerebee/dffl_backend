class AddSeasonPointsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :season_points, :jsonb
  end
end
