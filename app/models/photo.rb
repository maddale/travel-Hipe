class Photo < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :user
  validates :picture, presence: true
end
