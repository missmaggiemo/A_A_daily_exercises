var multiples = function(array) {
  return array.map(function(value) {
    return value * 2;
  });
}



//without map

var multiples = function(array) {
  for(var i = 0; i < array.length; i++) {
    array[i] = array[i] * 2;
  }
  return array
}