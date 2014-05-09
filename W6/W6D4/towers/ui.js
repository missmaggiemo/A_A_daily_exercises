(function(root){
  var Hanoi = root.Hanoi = (root.Hanoi || {});

  var UI = Hanoi.UI = function(game, $rootEl){
    this.game = game;
    this.$el = $rootEl;
  };

  UI.prototype.setUpTowers = function(){
    var stringHTML = "";
    for(var i = 0; i < 3; i++){
      stringHTML += "<div class='tower' id='tower_" +
      i +
      "' data-id=" +
      i +
      "></div>";
    }
    this.$el.html(stringHTML);
  }

  UI.prototype.setUpDiscs = function(){
    var colors = ['red', 'blue', 'yellow', 'green'];
    for(var i = 0; i < 4; i++){
      $('#tower_0').append("<div class='disc' id='disc_" +
        i +
        "' data-id=" +
        i +
        "></div>"
      );
      $('#disc_' + i).css("background-color", colors[i]);
      $('#disc_' + i).css("width", (i + 1) * 50);
    }
  }

  UI.prototype.setUpEvents = function(){
    $('.tower').click( this.selectTowerOne.bind(this) );
  }

  UI.prototype.selectTowerOne = function( event1 ){
    var game = this.game;
    this.$tower1 = $(event1.target).closest('.tower');
    $('.tower').off();
    $('.tower').click( this.selectTowerTwo.bind(this) );
  }

  UI.prototype.selectTowerTwo = function( event2 ) {
    var game = this.game;
    var $tower1 = this.$tower1;
    var $tower2 = $(event2.target).closest(".tower");
    var valid = game.takeTurn($tower1.data('id'), $tower2.data('id'));
    if (valid){
      this.moveDisc($tower1, $tower2);
      if(this.game.isWon()){
        $('body').append("<h1>You win!</h1>");
      }
    } else {
      alert("Invalid move!");
    }
    // reinstate select tower one
    $('.tower').off();
    $('.tower').click( this.selectTowerOne.bind(this) );
  }

  UI.prototype.moveDisc = function($startTower, $endTower){
    var $disc = $startTower.children(':first');
    $endTower.prepend($disc[0].outerHTML);
    $disc.remove();
  }

})(this);