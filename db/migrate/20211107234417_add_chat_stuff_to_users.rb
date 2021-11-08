class AddChatStuffToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :chat_username, :string
    add_column :users, :chat_secret, :string
  end
end
