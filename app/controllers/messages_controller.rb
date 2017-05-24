class MessagesController < ApplicationController
def create
    message = Message.new(message_params)
    message.user = current_user
if message.save
      #broadcasting out to messages channel including the chat_id so messages are broadcasted to specific chat only
      ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
      #message and user hold the data we render on the page using javascript
      message: message.message,
      user: message.user.profile.first_name,
      time: message.message_time

      )
    else
      redirect_to chats_path
    end
  end
private
    def message_params
      params.require(:message).permit(:message, :chat_id)
    end
end
