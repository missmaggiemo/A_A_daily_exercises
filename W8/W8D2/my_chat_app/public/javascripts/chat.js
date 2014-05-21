var Chat = function (socket) {
  this.io = socket;
  this.sendMessage = function(text) {
    this.io.emit('message', text); // call client message and server message different names?
  }

  this.changeNick = function(nick){
    this.io.emit('nickRequest', nick);
  }
}