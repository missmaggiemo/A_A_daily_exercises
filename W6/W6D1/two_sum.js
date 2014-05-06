Array.prototype.two_sum = function() {
  var answer = [];
  for(var i = 0; i < this.length; i++) {
    for(var j = i + 1 ; j < this.length; j++){
      if(this[i] + this[j] == 0){
        answer.push([i, j]);
      }
    }
  }
  return answer;
}