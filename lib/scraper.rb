require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url) 
    list = Nokogiri::HTML(html)
    names = list.css(".student-name")
    names_array = []
    names.each do |item|
      names_array << item.text
    end
    names_array
    
    locations = list.css(".student-location")
    location_array = []
    locations.each do |item|
      location_array << item.text
    end
    location_array
    
    webpages = list.css(".student-card a[href]")
    webpage_array = []
    webpages.select do |item|
    webpage_array << item['href']
    end
    webpage_array

    master_array = []
    hash = {}
    x = 0
    names_array.each do |name|
    master_array << {:name => name, :location => location_array[x], :profile_url => webpage_array[x]}
    x = x + 1
    end
    master_array

  end

  def self.scrape_profile_page(profile_url)

  end

end
