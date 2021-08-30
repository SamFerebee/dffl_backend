class AddLastPlaceFinishesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_place_finishes, :jsonb
  end
end
