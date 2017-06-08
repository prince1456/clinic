class Message < ApplicationRecord
  belongs_to :user
  has_many :users, through: :chats
  belongs_to :chat
  has_many :notifications, as: :notifiable, dependent: :destroy
  # after_save :notify
  # def notify
  #   notifications.build.save
  # end
  def message_time
      created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
