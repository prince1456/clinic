function messageForm(){
  var shiftDown = false;
  var chatForm = $("#new_message");
  var messageBox = $('#message_message');
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
           e.preventDefault(); // prevent another \n from being entered
      chatForm.submit();
      $(chatForm).trigger('reset');
          }
      }
  });
$(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });
$(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}
