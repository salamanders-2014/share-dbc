require 'faker'

User.delete_all
LearningStyle.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
LearningStyle.create([{name: 'Visual'}, {name: 'Auditory'}, {name: 'Read/Write'}, {name: 'Kinesthetic'}])


users = 100.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => "password", )