# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create(name: "Sammy", sex: "M", age: 11, color: "brown and black striped")
cat2 = Cat.create(name: "Serena", sex: "F", age: 8, color: "orange and white")
cat3 = Cat.create(name: "Balthazar", sex: "M", age: 18, color: "grey")
cat4 = Cat.create(name: "Beauty", sex: "F", age: 2, color: "white and brown")

crr1 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.today, end_date: Date.tomorrow, status: "PENDING")
crr2 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, -3), status: "PENDING")
crr3 = CatRentalRequest.create(cat_id: cat1.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, -3), status: "PENDING")
crr4 = CatRentalRequest.create(cat_id: cat2.id, start_date: Date.tomorrow, end_date: Date.new(2014, 4, 25), status: "PENDING")
