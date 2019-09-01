class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
