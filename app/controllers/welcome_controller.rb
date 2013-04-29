class WelcomeController < ApplicationController
  include ActionController::Live
  
  def index
    link_url = "http://www.therichest.org/entertainment/sexiest-chinese-actresses/"
    scraper = Webscraper::Multimedia.new(link_url)
    @contents = scraper.parse_chinese_actress()
    respond_to do|format|
      format.html  
      format.json { render json: {contents: @contents}.as_json() } 
    end 
  end
  
  def search_video

  end

  def video_listing 

  end
end
