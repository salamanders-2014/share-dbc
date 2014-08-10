LearningStyle.delete_all
Subject.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
LearningStyle.create([{name: 'Visual'}, {name: 'Auditory'}, {name: 'Read/Write'}, {name: 'Kinesthetic'}])

Subject.create!([{name: "RSpec"}, {name: "CSS"}, {name: "Ruby"}, {name: "SQL"}, {name: "ActiveRecord"}, {name: "Rails"}])
