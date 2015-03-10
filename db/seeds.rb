# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Fred', city: cities.first)


Developer.create(name: "Sally Smartypants", email: "sally@dev.com", password: "password")
Project.create(name: "Goat Magic", max_hours: 100)
