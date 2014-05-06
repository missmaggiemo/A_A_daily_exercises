var subsets = function(array) {
  if (array.length == 0) {
    return [array];
  } else {
    var bases = subsets(array.slice(0, array.length - 1));
    var addedElement = bases.map(
      function(el) { return el.concat(array[array.length-1]); }
    );
    return bases.concat(addedElement);
  }
}