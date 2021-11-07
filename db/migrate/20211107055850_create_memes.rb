class CreateMemes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
