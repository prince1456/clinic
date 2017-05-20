class Profile < ApplicationRecord
  has_many :directories, dependent: :destroy
  mount_uploader :image, ImageUploader
end
