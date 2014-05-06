Array.prototype.myMap = function(callback) {
  for(var i = 0; i < this.length; i++) {
    this[i] = callback(this[i]);
  }
  return this;
};

var callback = function(value) {
  return value+=1;
};

// without callback

Array.prototype.myMap = function() {
  for(var i = 0; i < this.length; i++) {
    this[i] += 1;
  }
  return this;
};
