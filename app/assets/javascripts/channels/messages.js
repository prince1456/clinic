
function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
          console.log(data)
    return "<li class="right clearfix"><span class="chat-img pull-right">" + data.user + ": </b>" + data.message + "</p>" + data.time;
  },
      });
return App.messages;
}
