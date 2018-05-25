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

remote_photo_urls = [
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-01.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-02.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-03.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-04.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-05.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-06.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-07.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-08.jpg",
  "https://www.seriouseats.com/images/2017/02/20170219-ramen-recipes-roundup-11.jpg",
  "https://atmedia.imgix.net/4228906cb4af7dccaf0c7809e5e354a1a6f693b0?auto=format&q=45&w=1033.0&fit=max&cs=strip",
  "https://photos.smugmug.com/Shoyu-Ramen/i-LZsWzC6/0/7519ee39/L/Screen%20Shot%202018-04-05%20at%207.24.31%20PM-L.png",
  "http://www.forkknifeswoon.com/wp-content/uploads/2014/10/20141003-Fork_Knife_Swoon_Simple_Homemade_Chicken_Ramen_WEB_01.jpg",
  "https://assets.bonappetit.com/photos/57ae038653e63daf11a4e122/16:9/w_1000,c_limit/shoyu-ramen.jpg",
  "https://www.iceorrice.com/wp-content/uploads/2017/10/DSC03435-2.jpg",
  "http://yestoyolks.com/wp-content/uploads/2016/10/IMG_4169.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjNnx9mM2LnKD3VnJuzqoBGmwdvFJ6B9Dl0ANWbaNBxxXdD7gj",
  "http://img1.cookinglight.timeinc.net/sites/default/files/styles/4_3_horizontal_-_1200x900/public/image/2016/04/main/1605p44-slow-cooker-ramen-bowls_0.jpg?itok=lCrjT-my",
]

names.zip(descriptions, remote_photo_urls).each do |e|
   ramen = Ramen.new(name: e.first, description: e[1], user_id: User.all[[0, 1].sample].id, portions_left: 5, price_per_portion: 10)
   ramen.remote_photo_url = e.last
   ramen.save!
   Portion.create!(portion_spoonful: 1, ramen_id: ramen.id)
 end


Tag.create!(ramen_id: Ramen.all.sample.id, category: 'Spicy')
Tag.create!(ramen_id: Ramen.all.sample.id, category: 'Sweet')
Tag.create!(ramen_id: Ramen.all.sample.id, category: 'Terriyaki')

