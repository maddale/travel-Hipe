class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  mount_uploader :avatar_back, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  

  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed   
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :posts, dependent: :destroy
  has_many :categories, through: :posts
  has_many :photos, dependent: :destroy
  has_many :places, through: :posts

  has_many :outboxes, foreign_key: "sender_id", class_name: "Message"
  has_many :inboxes, foreign_key: "respondent_id", class_name: "Message"
  has_many :messages, foreign_key: "user_id"


  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  validates :name, presence: true, length: { maximum: 60, minimum: 2 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensivity: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


def avatar_link(img_format)
  return self.avatar.url(img_format) || "/assets/" + img_format.to_s + "_default_user.png"
  
end

def User.new_remember_token
  SecureRandom.urlsafe_base64
end

def User.encrypt(token)
  Digest::SHA1.hexdigest(token.to_s)
end

def feed
  microposts.where("user_id = ?", id)
end

def following?(other_user)
  relationships.find_by(followed_id: other_user.id)
end

def follow!(other_user)
  relationships.create!(followed_id: other_user.id)  
end

def unfollow!(other_user)
  relationships.find_by(followed_id: other_user.id).destroy!
end

def cr_message(respondent_id, body)
  self.outboxes.create(respondent_id: respondent_id, body: body, user_id: self.id)
  self.outboxes.create(respondent_id: respondent_id, body: body, user_id: respondent_id)
  
end


private
  def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
  end
end
