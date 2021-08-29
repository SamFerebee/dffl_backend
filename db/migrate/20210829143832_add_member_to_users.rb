class AddMemberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :member, :boolean
    add_column :users, :admin, :boolean
  end
end
