Array.prototype.myEach = function(callback) {
  for(var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

var callback = function(value) {
  console.log(value);
};


//without callback

Array.prototype.myEach = function() {
  for(var i = 0; i < this.length; i++) {
    console.log(this[i]);
  }
};