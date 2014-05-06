// var piece = require('piece');

function Board(){
  var makeBoard = function(){
    var matrix = [];
    for(var i = 0; i < 8; i ++){
      matrix[i] = new Array(8);
    }
    matrix[3][3] = new Piece('red');
    matrix[4][3] = new Piece('blue');
    matrix[4][4] = new Piece('red');
    matrix[3][4] = new Piece('blue');
    return matrix;
  }

  this.layout = makeBoard();
}

Board.prototype.finished = function(){
  // are all the squares filled?
  var layout = this.layout;
  var filled = true;
  for(var row = 0; row < layout.length; row++){
    for(var col = 0; col < layout[row].length; col++){
      if (typeof layout[row][col] === "undefined"){
        filled = false;
      }
    }
  }
  return filled;
};

// game isn't over until all squares filled?