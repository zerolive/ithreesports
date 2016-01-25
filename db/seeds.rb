# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'admin', password: '12345678', level: 'Admin')
User.create!(name: 'user1', password: '12345678', level: '1')
User.create!(name: 'user2', password: '12345678', level: '2')
User.create!(name: 'user3', password: '12345678', level: '3')