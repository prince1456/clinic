
function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages ul").removeClass('hidden')
          return $('#messages ul').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
          console.log(data)
          if (location.href.match(/ar/)) {
                return "<li class='left clearfix'> <span class='chat-img pull-right'>" + "<img class='img-circle' src=" + data.image + "></img>"  + "</span> <div class='chat-body clearfix'><div class='header'><strong class='primary-font'>"+ data.user + "</strong><small class='text-muted'>" + data.time +"</small> <div> <p>" + data.message + "</p> </div></li>"
            }else{
              return "<li class='left clearfix'> <span class='chat-img pull-left'>" + "<img class='img-circle' src=" + data.image + "></img>"  + "</span> <div class='chat-body clearfix'><div class='header'><strong class='primary-font'>"+ data.user + "</strong><small class='text-muted'>" + data.time +"</small> <div> <p>" + data.message + "</p> </div></li>"
            }
  },
      });
return App.messages;
}
