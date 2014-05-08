Function.prototype.inherits = function (obj) {
  function Surrogate () {};
  Surrogate.prototype = obj.prototype;
  this.prototype = new Surrogate ();
}

function Animal () {};
Animal.prototype.saysHello = function () {
  console.log("Hello");
};


function Cat () {};
Cat.inherits(Animal);


var cat = new Cat();
cat.saysHello();
