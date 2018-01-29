class Place < ApplicationRecord
  has_and_belongs_to_many :posts
validates :ident, uniqueness: true
end
