class Post < ApplicationRecord
  mount_uploader :post_img, ImageUploader
  
  belongs_to :user
  belongs_to :category
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  has_and_belongs_to_many :places
  
  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end


end
