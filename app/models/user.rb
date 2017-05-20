class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :chats, through: :subscriptions
  has_many :directories, dependent: :destroy
  def fullname
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
