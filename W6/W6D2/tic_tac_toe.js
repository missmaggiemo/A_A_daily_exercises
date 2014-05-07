// Maggie Moreno and Andrew Chen
// W6D2

var readline = require("readline");

Array.prototype.allItemsSame = function(){
  if (this.length > 0) {
    for(var i = 1; i < this.length; i++){
      if (this[i] !== this[0]) {
        return false;
      }
    }
    return true;
  }
};


(function (root) {
  var TTT = root.TTT = (root.TTT || {});
  'use strict';

  var reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  var allItemsInArray = function(array){
    var allItems = array.allItemsSame();
    var notBlank = (array[0] !== undefined);
    return(allItems && notBlank);
  };

  function Board () {
    this.matrix = [new Array(3), new Array(3), new Array(3)];
  };

  Board.prototype.placeMarker = function(marker, row, col) {
    var board = this;
    // console.log(marker);
    if (board.matrix[row][col] !== undefined) {
      console.log("Invalid move! Choose another location! ");
      return false;
    }
    else {
      board.matrix[row][col] = marker;
      return true;
    }
  };

  Board.prototype.display = function() {
    var board = this;
    for(var i = 0; i < board.matrix.length; i++){
      console.log(board.matrix[i]);
    }
  };

  function Player(marker){
    this.marker = marker; // This will be 'X' or 'O'.
  };

  function Game(board, player1, player2) {
    this.board = board;
    this.player1 = player1;
    this.player2 = player2;
  };

  Game.prototype.noMoves = function() {
    var bmat = this.board.matrix;

    var gameOver = true;
    for (var i = 0; i < bmat.length; i++) {
      for (var j = 0; j < bmat[0].length; j++) {
        if (bmat[i][j] === undefined) {
          gameOver = false;
        }
      }
    }

    return gameOver;
  }

  Game.prototype.winner = function() {
    var game = this;
    var board = game.board.matrix;

    // row/col
    for(var row = 0; row < board.length; row ++){
      if(allItemsInArray(board[row])){
        return board[row][0];
      }
    };

    for(var col = 0; col < board[0].length; col ++){
      var columnArray = [];
      for(var row = 0; row < board.length; row++){
        columnArray.push(board[row][col]);
      }
      if(allItemsInArray(columnArray)){
        return columnArray[0];
      }
    };

    // diag
    var diags = [[board[0][0], board[1][1], board[2][2]],
      [board[0][2], board[1][1], board[2][0]]];

    for (var i = 0; i < diags.length; i++) {
      if(allItemsInArray(diags[i])) {
        return diags[0][0];
      }
    }
    return false;
  };

  Game.prototype.finished = function () {
    return (this.winner() || this.noMoves());
  };

  Game.prototype.askUser = function(marker) {
    var game = this;

    game.board.display();

    reader.question("Where would you like to place your marker? [row, column]: ", function(answer) {
      console.log(answer);
      coordinates = answer.match(/\d/gi).map(function (element) {
        return parseInt(element, 10);
      });

      var row = coordinates[0] - 1;
      var column = coordinates[1] - 1;

      var validMove = game.board.placeMarker(marker, row, column);

      if(!game.finished() && validMove){
        (marker === 'X') ? game.askUser('O') : game.askUser('X');
      }
      else if (validMove === false) {
        (marker === 'X') ? game.askUser('X') : game.askUser('O');
      }
      else {
        game.board.display();
        var winnerMarker = game.winner();

        if (winnerMarker) {
          console.log("Congratulations! " + winnerMarker + " has won!");
          reader.close();
        }
        else {
          console.log("Stalemate... no winner.");
          reader.close();
        }
      }
    });
  };

  board = new Board();
  player1 = new Player('X');
  player2 = new Player('O');
  new_game = new Game(board, player1, player2);
  new_game.askUser('X');

})(this);



// Make 2D array of 3x3 X
// Take player input X
// Display board X
// check for move validity X
// check for win
