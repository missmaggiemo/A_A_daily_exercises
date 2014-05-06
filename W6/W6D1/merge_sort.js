var mergeSort = function(array){
  if (array.length <= 1){
    return array;
  } else {
    var midpoint = Math.round(array.length / 2);
    var left = array.slice(0, midpoint);
    var right = array.slice(midpoint, array.length);

    return merge(mergeSort(left), mergeSort(right));
  }
}

var merge = function(arr1, arr2){
  var merged = [];

  while(arr1.length > 0 && arr2.length > 0){
    if (arr1[0] < arr2[0]){
      merged.push(arr1.shift());
    } else {
      merged.push(arr2.shift());
    }
  }
  return merged.concat(arr1, arr2);
}