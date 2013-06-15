class AssetVideosController < ApplicationController
  def search_video
    @contents = nil
    search_engine = params[:search_engine]
    query = params[:search_query].split().join('+')
    if search_engine == "youtube"
      @contents = Webscraper::YouTube.search("http://www.youtube.com/results?search_query=#{query}")
    end
    render json: @contents.as_json() 
  end

  def index

  end
end
