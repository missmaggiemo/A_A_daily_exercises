Array.prototype.bubbleSort = function() {
  var notSorted = true;
  while (notSorted) {
    notSorted = false;
    for (var i = 1; i < this.length; i++) {
      if (this[i-1] > this[i]) {
        var first = this[i-1];
        var second = this[i];
        this[i-1] = second;
        this[i] = first;
        notSorted = true;
      }
    }
  }
  return this;
}

