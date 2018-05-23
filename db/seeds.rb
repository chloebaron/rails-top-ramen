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

url = 'https://greatist.com/eat/healthier-ramen-recipes'
names = Nokogiri::HTML(open(url).read).search('.title-wrapper h3 a').map do |e|
   e.text.split('. ').last
end

descriptions = Nokogiri::HTML(open(url).read).search('.slide-body p:nth-child(2)').map do |e|
    e.text
end

# p names.size == descriptions.size
names.zip(descriptions).each do |e|
  user = User.new(email:"#{Faker::Pokemon.name}@#{Faker::Pokemon.location.gsub(" ", "")}.com", password:"testing")
  user.save!
  ramen = Ramen.new(name: e.first, description: e.last, user_id: user.id)
  ramen.remote_photo_url = "https://source.unsplash.com/1600x900/?ramen-noodles"
  ramen.save!
end
