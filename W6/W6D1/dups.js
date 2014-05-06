Array.prototype.uniq = function() {
  var a = [];
  for (var i = 0; i < this.length; i++){
    if (a.indexOf(this[i]) == -1){
      a.push(this[i]);
    }
  }
  return a
}