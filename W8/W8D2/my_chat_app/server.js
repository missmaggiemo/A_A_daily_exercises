var http = require('http');
var ns = require('node-static');
var chatServer = require('./lib/chat_server');

var file = new ns.Server('./public');

var server = http.createServer(function (request, response) {
  request.addListener('end', function () {

    file.serve(request, response, function (err, result) {
      if (err) {
        console.log("Error serving " + request.url + ' - ' + err.message);

        response.writeHead(err.status, err.headers);
        response.end();
      }
    });
  }).resume();
}).listen(8080);

chatServer.createChat(server);


console.log('Server running at localhost:8080');