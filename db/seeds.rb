# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
royalty = ["Grand", "Regal", "High", "Noble", "Pompous", "Exalted", "Glorious", "Elite", "Gilded", "Royal" ]
rating = ["Meh", "By her majesty!"]

9.times do
  user = User.new(email: "#{Faker::Pokemon.name.downcase}@gmail.com", password: "testing")
  user.save!

  ramen = Ramen.new(name:"The #{royalty[rand(0..9)]} #{Faker::Food.ingredient} Ramen", description: Faker::Food.description, user_id: user.id)
  ramen.save!
end
