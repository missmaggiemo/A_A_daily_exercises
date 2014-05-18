# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Board.create(title: "Board 1", description: "Nursery rhymes.", sort_id: 1)
Board.create(title: "Board 2", sort_id: 2)

List.create(board_id: 1, title: "List 1-1", sort_id: 1)
List.create(board_id: 2, title: "List 2-1", sort_id: 2)

Card.create(list_id: 1, content: "Mary had a little lamb whose fleece was white as snow.", sort_id: 1)
Card.create(list_id: 1, content: "And everywhere that Mary went, the lamb was sure to go.", sort_id: 2)
