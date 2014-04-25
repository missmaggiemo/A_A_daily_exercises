# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = %w(January February March April May June July August September October November December)
users = []
names.each do |name|
  users << User.new(name: name, email: "#{name}@months.com", username: name.downcase, password: "#{name.downcase}_year")
end

users.each(&:save)

