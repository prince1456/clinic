class User < ApplicationRecord
  has_many :notifications, foreign_key: :recipent_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :message
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions
  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
    existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end
  def fullname
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  def self.search_users(search)
    joins(:profile).where("first_name ILIKE ? OR email ILIKE ? OR last_name ILIKE ? OR first_name_arabic ILIKE ? OR last_name_arabic ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}","#{search}" )
  end

end
