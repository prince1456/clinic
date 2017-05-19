class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  mount_uploader :picture, ImageUploader
  mount_uploader :attachments, AvatarUploader
  mount_uploader :video, AvatarUploader
  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by_user_id user
  end
end
