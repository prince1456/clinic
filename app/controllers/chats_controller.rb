require 'securerandom'
class ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
    @users = User.all.order(id: :desc).page params[:page]
  end
  def create
    @other_user = User.find(params[:other_user])
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat,  :other_user => @other_user.id)
  end
  def show
    @chat = Chat.find_by(id: params[:id])
    (@chat.users - [current_user]).each do | user|
        @other_user = user
    end
    # @other_user = User.find(params[:other_user])
    @message = Message.new
    @dd = @chat.messages.order(id: :asc)
  end
private
  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    nil
  end

end
