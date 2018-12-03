require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    html = File.open(index_url)
    doc = Nokogiri::HTML(html)
    doc.css(".main-wrapper.roster .student-card").collect do |student_card|
      name = student_card.css("h4").text
      location = student_card.css(".student-location").text
      profile_url = student_card.css("a").attributes("href").value
      {name: name, location: location, profile_url: profile_url}
  end

  def self.scrape_profile_page(profile_url)

  end

end
