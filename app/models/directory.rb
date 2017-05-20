class Directory < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  mount_uploader :file, AvatarUploader

end
