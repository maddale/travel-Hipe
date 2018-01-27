class AddPostimgToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_img, :string
  end
end
