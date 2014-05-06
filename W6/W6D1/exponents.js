var exp = function(number, ex){
  if (ex == 0){
    return 1;
  } else {
    return exp(number, ex - 1) * number;
  }
}