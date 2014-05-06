var transpose = function(matrix) {
  var array = [];
  for(var i = 0; i < matrix[0].length; i++) {
    array.push(new Array(matrix.length));
  }

  for(var row = 0; row < matrix.length; row++) {
    for(var col = 0; col < matrix[row].length; col++) {
      array[col][row] = matrix[row][col];
    };
  }
  return array;
}