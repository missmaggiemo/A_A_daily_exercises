// Maggie Moreno and Andrew Chen
// W6D2

var readline = require("readline");

(function (root) {
  var Hanoi = root.Hanoi = (root.Hanoi || {});

  var reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  var checkType = function(element, typeStr) {
    return (typeof(element) === typeStr);
  };

  function Game () {
    this.towers = [[1,2,3,4], new Array(4), new Array(4)]
  };

  Game.prototype.displayTowers = function(){
    var towers = this.towers;

    var viewMatrix = new Array(towers[0].length);

    for (var i = 0; i < viewMatrix.length; i++) {
      viewMatrix[i] = new Array(towers.length);
    };

    for(var row = 0; row < towers.length; row++) {
      for(var col = 0; col < towers[0].length; col++) {
        if (towers[row][col] === undefined) {
          viewMatrix[col][row] = "-";
        }
        else {
          viewMatrix[col][row] = towers[row][col];
        }
      }
    }

    for(var i = 0; i < viewMatrix.length; i++){
      console.log(viewMatrix[i]);
    }
  };



  Game.prototype.finished = function(){
    var game = this;
    // if all the disks are on a stack that isn't 1, then the game is over, e.g. if all disks are on stack 2 or all disks are on stack 3

    for(var i = 1; i < game.towers.length; i ++){
      gameOver = true;
      for(var j = 0; j < game.towers[i].length; j ++){
        var undef = checkType(game.towers[i][j],"undefined");
        if(undef && i < game.towers.length - 1){
          gameOver = false;
          break;
          // goes on to next i in for loop?
        } else if(undef && i === game.towers.length - 1) {
          return false;
        }
      }
    }
    return true;
  };

  Game.prototype.moveDisk = function (answer1, answer2) {
    var diskOnMove;
    // 0...3
    for (var i = 0; i < game.towers[0].length; i++) {
      if (checkType(game.towers[answer1 - 1][i], "number")) {
        diskOnMove = game.towers[answer1 - 1][i];
        game.towers[answer1 - 1][i] = undefined;
        break;
      }
    }

    for (var i = game.towers[0].length - 1; i >= 0; i--) {
      if (checkType(game.towers[answer2 - 1][i], "undefined")) {
        game.towers[answer2 - 1][i] = diskOnMove;
        break;
      }
    }
  };

  Game.prototype.checkValidity = function (answer1, answer2) {
    for (var i = 0; i < game.towers[0].length; i++) {
      if (checkType(game.towers[answer1 - 1][i], "number")) {
        var compareDisk1 = game.towers[answer1 - 1][i];
        break;
      }
    }

    for (var i = 0; i < game.towers[0].length; i++) {
      if (checkType(game.towers[answer2 - 1][i], "number")) {
        var compareDisk2 = game.towers[answer2 - 1][i];
        break;
      }
    }

    if (compareDisk1 > compareDisk2) {
      return false;
    }
    else {
      return true;
    }
  };

  Game.prototype.askUser = function () {
    var game = this;
    game.displayTowers();

    reader.question("Which tower would you like to take a disk from? ", function(answer1){
      console.log(answer1);

      reader.question("Which tower would you like to place the disk on? ", function(answer2){
        console.log(answer2);
        // here move disks
        answer1 = parseInt(answer1);
        answer2 = parseInt(answer2);

        if (game.checkValidity(answer1, answer2) === true) {
          game.moveDisk(answer1, answer2);
        }
        else {
          console.log("Invalid move!");
        }

        if(!game.finished()){
          game.askUser();
        }
        else {
          game.displayTowers();
          console.log("Congratulations! You're as smart as a chimp!");
          reader.close();
        }
      });
    });
  };

  var game = new Game();
  game.askUser();


})(this);