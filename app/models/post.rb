class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  mount_uploader :picture, ImageUploader
  mount_uploader :attachments, AvatarUploader
  mount_uploader :video, AvatarUploader
  # translates :title , :content, :auther, :picture, :video, :attachments
  validates :title, presence: {message: "title has to be present"}
  validates :content, presence: {message: 'content has to be present'}
  validates :picture, presence: {message: 'picture has to be present'}
  validates :author, presence: {message: 'auther has to be present'}

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |post|
      csv << post.attributes.values_at(*column_names)
    end
  end
end

def self.import(file)
  CSV.foreach(file.path, header: true) do |row|
    Post.create! row.to_hash
  end
end

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by_user_id user
  end
  def self.search_posts(search)
    where("title ILIKE ? OR author ILIKE ?", "%#{search}", "%#{search}")
  end
end
