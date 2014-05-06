var arrSum = function (arr) {
  if (arr.length == 1) {
    return arr[0];
  }
  else {
    var lessOne = arr.slice(0, arr.length - 1); // arr with one less element
    var lastOne = arr[arr.length - 1]; // last element in array
    return arrSum(lessOne) + lastOne;
  }
}