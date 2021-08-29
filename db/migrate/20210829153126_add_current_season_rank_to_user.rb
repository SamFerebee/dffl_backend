class AddCurrentSeasonRankToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :current_season_rank, :integer
  end
end
