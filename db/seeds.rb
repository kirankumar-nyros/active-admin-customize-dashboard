# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Skill.create(name: 'C Programming')
Skill.create(name: 'Java Programming')
Skill.create(name: 'Ruby on Rails')
Skill.create(name: 'Php')
Skill.create(name: 'Phython')
Skill.create(name: 'JavaScript')
Skill.create(name: 'HTML5')
Skill.create(name: 'Microsoft SQL')

# Creating Groups for Persons

Group.create(name: 'Developers')
Group.create(name: 'Sr. Developers')
Group.create(name: 'Quality Engineer')
Group.create(name: 'Project Leads')
Group.create(name: 'N & S Team')
Group.create(name: 'TechnicalSupport')