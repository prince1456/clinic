json.array! @notifications do |notification|

  json.actor notification.actor.profile.first_name
  json.action notification.action
  # json.dd notification.notifiable
  json.notifiable do
    json.type "a #{ notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url user_chat_path(current_user, notification.notifiable.chat_id)
  # json.url ".../users/#{current_user.id}/chats/#{notification.notifiable.chat_id}?other_user=#{notification.actor.id}"


end
