class AddNumOfRatingsToMemes < ActiveRecord::Migration[6.1]
  def change
    add_column :memes, :num_of_ratings, :int
  end
end
