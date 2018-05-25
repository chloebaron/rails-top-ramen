# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "nokogiri"
require 'open-uri'
require 'faker'

User.destroy_all

url = 'https://greatist.com/eat/healthier-ramen-recipes'
names = Nokogiri::HTML(open(url).read).search('.title-wrapper h3 a').map do |e|
   e.text.split('. ').last
end

descriptions = Nokogiri::HTML(open(url).read).search('.slide-body p:nth-child(2)').map do |e|
    e.text
end

User.create!(email:"test1@test.com", password: "testing")
User.create!(email:"test2@test.com", password: "testing")


names.zip(descriptions).each do |e|
   ramen = Ramen.new(name: e.first, description: e.last, user_id: User.all[[0, 1].sample].id, portions_left: 5, price_per_portion: 10)
   ramen.remote_photo_url = "https://source.unsplash.com/1600x900/?ramen-noodles"
   ramen.save!
   Portion.create!(portion_spoonful: 1, ramen_id: ramen.id)
 end


Tag.create!(ramen_id: 1, category: 'Spicy')
Tag.create!(ramen_id: 2, category: 'Sweet')
Tag.create!(ramen_id: 3, category: 'Terriyaki')
