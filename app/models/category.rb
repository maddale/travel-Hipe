class Category < ApplicationRecord
has_many :posts
has_many :users, through: :posts
default_scope -> { order('name') }
validates :name, presence: :true

end
