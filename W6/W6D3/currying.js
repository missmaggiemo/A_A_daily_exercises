var sum = function () {
  var args = [].slice.call(arguments);
  var total = 0;

  for ( var i = 0; i < args.length; i++ ) {
    total += args[i];
  }
  return total;
};

Function.prototype.curry = function (n, itemArr) {
  var itemArr = itemArr || [];
  var fn = this;

  return function innerCurry() {
    for (var i = 0; i < arguments.length; i++) {
       itemArr.push(arguments[i]);
     }
    if (itemArr.length === n){
      return this.apply(this, itemArr);
    } else {
      return innerCurry.bind(this);
    }
  }.bind(fn);
};

function curriedSum (n) {
  return sum.curry(n);
}

// var f1 = sum.curry(3);
// var f2 = f1(2);
// var f3 = f2(5);
// var result = f3(10);
// console.log(result);

console.log(sum.curry(3)(2)(5)(10));

var summation = curriedSum(3);
console.log(summation(2,5,10));
