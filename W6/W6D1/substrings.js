String.prototype.substrings = function () {
  var answer = [];
  for(var i = 0; i < this.length; i++) {
    for(var j = i + 1; j < (this.length + 1); j++) {
      var sub = this.slice(i, j);
      if (answer.indexOf(sub) == -1) {
        answer.push(sub);
      }
    }
  }
  return answer;
}