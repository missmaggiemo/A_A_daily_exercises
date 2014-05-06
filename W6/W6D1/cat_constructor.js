function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
    return this.owner + " loves " + this.name;
}

var billy = new Cat("Billy", "Will");
var silly = new Cat("Silly", "Phil");

Cat.prototype.cuteStatement = function() {
    return "everyone loves " + this.name;
}

Cat.prototype.meow = function() {
  return "meow";
}

billy.meow = function() {
  return "billy meow";
}