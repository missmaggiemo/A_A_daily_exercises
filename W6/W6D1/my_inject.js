Array.prototype.myInject = function(callback) {
  var sum = this[0];
  for(var i = 1; i < this.length; i++) {
    sum = callback(sum, this[i]);
  }
  return sum;
};

var callback = function(sum, value) {
  return sum += value;
};

//without callback

Array.prototype.myInject = function() {
  var sum = this[0];
  for(var i = 1; i < this.length; i++) {
    sum += this[i];
  }
  return sum;
}