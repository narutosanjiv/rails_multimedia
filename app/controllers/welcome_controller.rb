class WelcomeController < ApplicationController
  include ActionController::Live
  
  def index
    link_url = "http://www.therichest.org/entertainment/sexiest-chinese-actresses/"
    scraper = Webscraper::Multimedia.new(link_url)
    @contents = scraper.parse_chinese_actress()
  
  end

end
