class AddUserIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :user_id, :integrer
    add_index :messages, :user_id
  end

end
