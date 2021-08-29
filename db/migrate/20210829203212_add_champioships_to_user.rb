class AddChampioshipsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :championships, :jsonb
    add_column :users, :playoff_appearances, :jsonb
  end
end
