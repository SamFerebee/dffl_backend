class AddMemesRatedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :memes_rated, :jsonb
  end
end
