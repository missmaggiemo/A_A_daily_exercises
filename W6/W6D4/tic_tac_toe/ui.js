(function(root) {
  var TTT = root.TTT = ( root.TTT || {} );
  // ui needs to have access to game logic

  var UI = TTT.UI = function(game, $rootEl) {
    // make the squares on the board
    this.game = game;
    var htmlString = "";
    for (var i = 0; i < 9; i++) {
      htmlString += "<div class='square' data-id='" + i + "'></div>";
    }
    this.$el = $rootEl;
    this.$el.html(htmlString);
  };

  UI.prototype.setUpEvents = function(){
    // add events to all the squares on the board
    $('.square').click(this.placeMarker.bind(this));
  };

  UI.prototype.placeMarker = function(event){
    // when someone clicks, set their marker
    event.preventDefault();

    var $square = $(event.target);

    var valid = this.game.turn( $square.data("id") );

    if (valid) {
      // draw the marker in the square
      $square.html(valid);
    } else {
      alert("Invalid move!");
    }

    var winner = this.game.winner();
    if (winner) {
      $('body').append("<h1 id='winner'>" + winner.toUpperCase() + " won!</h1>");
      $('#board').css('background-color', 'pink');
    }
  };
})(this);