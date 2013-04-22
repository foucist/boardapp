# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT USERS'
user2 = User.find_or_create_by_email :name => 'Joe Silver', :email => 'silver@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user2.statuses.create(entry: "Available")
user3 = User.find_or_create_by_email :name => 'Sarah Gold', :email => 'gold@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user3.statuses.create(entry: "In a meeting")
user4 = User.find_or_create_by_email :name => 'Bob Platinum', :email => 'platinum@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user4.statuses.create(entry: "Out to lunch")
puts "users: #{user2.name}, #{user3.name}, #{user4.name}"
