require "nokogiri"
require 'open-uri'

url = 'https://greatist.com/eat/healthier-ramen-recipes'
names = Nokogiri::HTML(open(url).read).search('.title-wrapper h3 a').map do |e|
   e.text.split('. ').last
end

descriptions = Nokogiri::HTML(open(url).read).search('.slide-body p:nth-child(2)').map do |e|
    e.text
end


#page > div.article-container.ng-scope > div.article-main > div.article-main-column.main-column > article > div.article-body.block > div.article-body-content > section > div:nth-child(2) > div.slide-body > p:nth-child(2)
