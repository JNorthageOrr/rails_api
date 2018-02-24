# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.new
admin.name = 'Banana King'
admin.email = 'admin@bananas.com'
admin.password = 'bananaKing'
admin.password_confirmation = 'bananaKing'
admin.save

user = User.new
admin.name = 'Banana Bro'
user.email = 'user@bananas.com'
user.password = 'bananaBro'
user.password_confirmation = 'bananaBro'
user.save