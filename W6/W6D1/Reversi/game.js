function Game() {
  this.board = new Board;
}

Game.prototype.placePiece = function(position, color){
  this.board.layout[position[0]][position[1]] = new Piece(color);
}