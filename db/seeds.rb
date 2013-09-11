# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# La cuenta de administrador por defecto
User.create(	name: "admin", 
				email: "admin@elbuengusto.com", 
				password: "000000", 
				password_confirmation: "000000", 
				admin: true)