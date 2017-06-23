# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.transaction do
  User.create!(password: 'password', name: 'Jacqui Nelson', email: 'jacqnelson@gmail.com', isadmin: 1)
  User.create!(password: 'password', name: 'Jacqui 2', email: 'jacqnelson+2@gmail.com', isadmin: 0)

  Order.create!(name: '1st dues' , due_date: "2017-08-01 00:00:00", user_id: 1, amount: 10000 )
  Order.create!(name: '2nd dues' , due_date: "2017-09-01 00:00:00", user_id: 1, amount: 10000 )
  Order.create!(name: '3rd dues' , due_date: "2017-10-01 00:00:00", user_id: 1, amount: 10000 )
  Order.create!(name: '4th dues' , due_date: "2017-11-01 00:00:00", user_id: 1, amount: 10000 )
end
