class Notification < ApplicationRecord

  belongs_to :actor, class_name: 'User'
  belongs_to :recipent, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
  scope :unread, ->{ where(read_at: nil)}
  def self.count_notification
    Notification.count
  end
  def self.count_chat
      where(notifiable_type: "Chat").count
  end
  # def self.count_message
  #     where(notifiable_type: "Message").count
  # end
  # def self.count_visitor
  #     where(notifiable_type: "Visitor").count
  # end
end
