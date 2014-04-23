# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(name: "Fred Flintstone", email: "flintstone@aol.com", username: "fflint")
user2 = User.create(name: "Wilma Flintstone", email: "wilmaf@aol.com", username: "wilma_wilma")
user3 = User.create(name: "Barney Rubble", email: "barney@gmail.com", username: "brubble")
user4 = User.create(name: "Betty Rubble", email: "betty.rubble@gmail.com", username: "bettymdear")
user5 = User.create(name: "Bobby Rubble", email: "bobby.rubble@gmail.com", username: "bobby")
user6 = User.create(name: "Blubby Rubble", email: "blubby.rubble@gmail.com", username: "blubby")
user7 = User.create(name: "Billy Rubble", email: "billy.rubble@gmail.com", username: "billy")

contact1 = Contact.create(name: "Barney Rubble", email: "barney@gmail.com", user_id: 1, favorite: true)
contact2 = Contact.create(name: "Wilma Flintstone", email: "wilmaf@aol.com", user_id: 1, favorite: true)
contact3 = Contact.create(name: "Wilma Flintstone", email: "wilmaf@aol.com", user_id: 3 )
contact4 = Contact.create(name: "Wilma Flintstone", email: "wilmaf@aol.com", user_id: 4 )
contact5 = Contact.create(name: "Fred Flintstone", email: "flintstone@aol.com", user_id: 3, favorite: true)
contact6 = Contact.create(name: "Blubby Rubble", email: "blubby.rubble@gmail.com", user_id: 6)


share1 = ContactShare.create(user_id: 2, contact_id: 1)
share2 = ContactShare.create(user_id: 2, contact_id: 4)
share3 = ContactShare.create(user_id: 1, contact_id: 6, favorite: true)

g1 = Group.create(name: "AppAcademyGroup", user_id: user1.id)
g2 = Group.create(name: "Rubbles", user_id: user2.id)

gm1 = GroupMembership.create(group_id: g1.id, contact_id: contact2.id)
gm2 = GroupMembership.create(group_id: g2.id, contact_id: contact1.id)
gm3 = GroupMembership.create(group_id: g2.id, contact_id: contact6.id)
