# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.transaction do
  User.create!(password: 'monkeymonkeymonkey', name: 'Chrissy Duggar', email: 'contessabordeaux@gmail.com', isadmin: 1)
  User.create!(password: 'password', name: 'Jacqui 2', email: 'jacqnelson+4@gmail.com', isadmin: 0)
  User.create!(password: 'password', name: 'Jacqui, 2', email: 'jacqnelson+2@gmail.com', isadmin: 0)
  User.create!(password: 'password', name: 'Jacqui 3', email: 'jacqnelson+3@gmail.com', isadmin: 0)
  User.create!(password: 'password', name: 'Jacqui, 4 ', email: 'jacqnelson+4@gmail.com', isadmin: 0)

orders.each do |order| order.update_attributes(amount: 0) end

  User.find(2).Orders.update_attributes()
  Order.create!(name: '1st dues' , due_date: "2017-10-01 00:00:00", user_id: 562391269, amount: 10000 )
  Order.create!(name: '2nd dues' , due_date: "2017-09-01 00:00:00", user_id: 562391269, amount: 10000 )
  Order.create!(name: '3rd dues' , due_date: "2017-10-01 00:00:00", user_id: 562391269, amount: 10000 )
  Order.create!(name: '4th dues' , due_date: "2017-11-01 00:00:00", user_id: 562391269, amount: 10000 )
end

User.update_all(note: "You're a Sexah Monkey")
User.find(23).update_attributes(note: "You're a super Sexah Monkey and your dues have been waived due to storage of monkey stuff.")

User.find(56).update_attributes(note: "You're a super Sexah Monkey and your dues have been waived due to going above and beyond your sexah duties.")

User.find(1).update_attributes

User.find(562391269).update_attributes(isadmin: 1)


puts User.all.map(&:email).join"\n"

allisonlalbert@gmail.com
reneealexius@hotmail.com
L.Apsey09@gmail.com
jessiemsy@gmail.com
donnachicks@yahoo.com
ashley.bellant@gmail.com
brittourelle@gmail.com
nmc006@gmail.com
chernow@gmail.com
jwclark504@me.com
jessica.siouxsie@gmail.com
julianarosemusic@gmail.com
raquiderganzbaker@gmail.com
shannondettrow@gmail.com
fran@jfsneworleans.org
spidergyrl@gmail.com
emily.loska@gmail.com
erinlee2416@gmail.com
kf296@nau.edu
vfontenot@gmail.com
maryvirginiagoldie@gmail.com
dguzman1@tulane.edu
sarahbyfoot@gmail.com
undercummer@gmail.com
kjennings822@gmail.com
jeschecter@gmail.com
emilyjoeljones@gmail.com
jen.m.latimer@gmail.com
kaylalemaire@yahoo.com
mtater66@outlook.com
whitneykristenmc@gmail.com
melanierayne@gmail.com
kmiles@lsuhsc.edu
mnaughton2@gmail.com
jacqnelson@gmail.com
kaitfoconnor@gmail.com
perrycassdesigns@gmail.com
ktmp716@gmail.com
carolineprechter@gmail.com
Luella.provenza@gmail.com
chelseyrichter22@gmail.com
claire.elise.r@gmail.com
jessica.rosgaard@gmail.com
leahbonay@Gmail.com
fabmrss@gmail.com
bubbkite@aol.com
clairestewartwork@gmail.com
sarahtaylor2004@yahoo.com
amytilling@gmail.com
voodat@gmail.com
jvosbein@msn.com
rlwingo@gmail.com
wolflovesmusic@gmail.com
mckziegler@gmail.com
