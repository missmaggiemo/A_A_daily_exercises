var io = require('socket.io');

function createChat(server) {
  var chatIO = io.listen(server);
  var guestnumber = 1;
  var nicknames = {};

  chatIO.sockets.on('connection', function (socket) {
    console.log('client connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    nicknames[socket.id] = 'guest' + guestnumber;
    guestnumber++;

    chatIO.sockets.emit('message', {
      nickname: 'THY LORD',
      text: nicknames[socket.id] + " has entered the box."
    });

    // nicknames.push('guest' + guestnumber)
    // socket.emit('message', { text: "hello world"});
    socket.on('nickRequest', function (data) {
      var oldNick = nicknames[socket.id];
      nicknames[socket.id] = data;
      chatIO.sockets.emit('message', {
        nickname: 'THY LORD',
        text: oldNick + ' is now called ' + nicknames[socket.id],
      });

      // chatIO.sockets.emit('nicknames', {
      //   nicknames: nicknames
      // });
      // TODO: server logic for pushing nicknames to client for display
    });
    socket.on('message', function (data) {
      chatIO.sockets.emit('message', {
        nickname: nicknames[socket.id],
        text: data
      });
    });

    socket.on('disconnect', function () {
      console.log('RUNNING CODE ON CLIENT CLOSE I HOPE!!!!!')
      chatIO.sockets.emit('message', {
        nickname: 'THY LORD',
        text: nicknames[socket.id] + ' has left the box.'
      });
      delete nicknames[socket.id];
    });
  });





}

module.exports.createChat = createChat;