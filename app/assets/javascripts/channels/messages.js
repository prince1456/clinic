
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
          var b ="<li class='right clearfix'> <span class='chat-img pull-right'>" + "<img class='img-circle' src=" + data.image + "></img>"  + "</span> <div class='chat-body clearfix'><div class='header'><small class='text-muted'>" + data.time +"</small> </div> <p>" + data.message + "</p> </div></li>"
          var a = "<li class='left clearfix'> <span class='chat-img pull-left'>" + "<img class='img-circle' src=" + data.image + "></img>"  + "</span> <div class='chat-body clearfix'><div class='header'><small class='text-muted'>" + data.time +"</small> </div> <p>" + data.message + "</p> </div></li>"
          console.log("username=" + data.user)
          console.log(document.cookie)
            if ("username=" + data.user === document.cookie){
              return b;
            } else{
              return a;
            }

  },
      });
return App.messages;
}
