# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#
cat1 = Cat.create(name: "Sammy", sex: "M", age: 11, color: "brown")
cat2 = Cat.create(name: "Serena", sex: "F", age: 8, color: "orange")
cat3 = Cat.create(name: "Balthazar", sex: "M", age: 18, color: "white")
cat4 = Cat.create(name: "Beauty", sex: "F", age: 2, color: "tabby")
cat5 = Cat.create(name: "Motu", sex: "M", age: 8, color: "blue")

crr1 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.today, end_date: Date.tomorrow, status: "PENDING")
crr2 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, -3), status: "PENDING")
crr3 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, -3), status: "PENDING")
crr4 = CatRentalRequest.create(cat_id: cat2.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, 25), status: "PENDING")

user1 = User.new(user_name: "Maggie", password: "Ilovesammy")
user2 = User.new(user_name: "Phil", password: "catsarecool")
user3 = User.new(user_name: "Paul", password: "Iloverobots")
user1.save
user2.save
user3.save

cat1.update(user_id: user1.id)
cat5.update(user_id: user2.id)
cat4.update(user_id: user3.id)
