class Profile < ApplicationRecord
  has_many :directories, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
end
