var bsearch = function(array, target) {
  if(array.length == 0) {
    return null;
  }
  else {
    var midpoint = Math.floor(array.length / 2);

      if (target < array[midpoint]) {
        return bsearch(array.slice(0, midpoint), target);
      }
      else if (target == array[midpoint]) {
        return midpoint;
      }
      else if (target > array[midpoint]) {
        return bsearch(array.slice(midpoint, array.length), target) + midpoint;
      }
  }
}