var range = function (start, end) {
  if (start === end) {
    return [start];
  }
  else {
    return range(start, end-1).concat(end);
  }
}