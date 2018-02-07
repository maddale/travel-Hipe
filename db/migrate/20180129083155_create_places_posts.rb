class CreatePlacesPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :places_posts, id: false do |t|
      t.belongs_to :place
      t.belongs_to :post
    end
    add_index :places_posts, [:place_id, :post_id], unique: true
  end
end
