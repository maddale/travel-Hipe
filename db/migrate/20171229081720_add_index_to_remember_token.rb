class AddIndexToRememberToken < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :remember_token
  end
end
