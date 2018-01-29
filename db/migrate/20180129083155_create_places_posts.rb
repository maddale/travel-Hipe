class CreatePlacesPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :places_posts, id: false do |t|
      t.string :place_id
      t.string :post_id
    end
    add_index :places_posts, [:place_id, :post_id], unique: true
  end
end
