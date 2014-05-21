
$(document).ready(function () {
  console.log('sup');
  var ioConnect = io.connect();
  var chat = new Chat(ioConnect);
  ioConnect.on('message', function (data) {
    var messageHtml = $("<span></span>").text(unescape(data.nickname) + ": " + unescape(data.text));
    $('#message-box').append(messageHtml).append("<br>");
    $("#message-box").scrollTop($("#message-box")[0].scrollHeight);
  });

  $('form').on('click', 'button', function (event) {
    event.preventDefault();
    var message = $('#message').val();
    if(message.match(/^\/nick/)){
      message = message.replace("/nick ", "");
      console.log(message);
      chat.changeNick(escape(message));
    } else {
      message = escape(message);
      chat.sendMessage(message);
    }

    // $('#message-box').append(message + "<br>");
    $('#message').val('');
  });
});

