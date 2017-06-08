class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  #if chat is destroyed all messages and subscriptions will also be  destroyed
  has_many :users, through: :subscriptions
  validates :identifier, presence: true, uniqueness: true,
     case_sensitive: false


  after_save :notify
  def notify
    notifications.build.save
  end
end
