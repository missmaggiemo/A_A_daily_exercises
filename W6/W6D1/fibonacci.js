var fibonacci = function(n){
  if(n == 1){
    return [0];
  } else if (n == 2){
    return [0, 1];
  } else {
    var last = fibonacci(n - 1);
    last.push(last[last.length - 2] + last[last.length - 1]);
    return last;
  }

}