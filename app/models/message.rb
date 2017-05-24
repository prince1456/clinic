class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  def message_time
      created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
