# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_messages = {
  Peter: 'Hello All',
  Josh: 'Mysterious evening',
  Esther: 'Hi guys',
  Bella: 'Evening!',
  John: 'Hola!',
  Rose: 'Hello People!'
}

users_messages.each do |username, message|
  user = User.create(username: username, password: 'password')
  message = Message.create(body: message, user: user)
end

