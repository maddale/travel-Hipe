class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :picture
      t.integer :user_id

      t.timestamps
    end
  add_index :photos, :user_id
  end
end
