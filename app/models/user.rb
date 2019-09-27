class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 15 } 
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  
  has_secure_password
  
  has_many :posts, dependent: :destroy 
  has_many :comments, dependent: :destroy  
  has_many :likes, dependent: :destroy 
  belongs_to :prefecture, optional: true
end
