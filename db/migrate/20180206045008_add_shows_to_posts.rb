class AddShowsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :shows, :integer, default: 0
  end
end
