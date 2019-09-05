class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_many :likes, dependent: :destroy 
  has_many :like_users, through: :likes, source: 'user'

  mount_uploader :image, ImageUploader
end
