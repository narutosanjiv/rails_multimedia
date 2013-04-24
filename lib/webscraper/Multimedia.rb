module Webscraper
  class Multimedia
    def initialize(web_page, rules = {})
      @web_url = web_page
    end

    def parse_chinese_actress
      page = Nokogiri::HTML(open(@web_url)) 
      all_images = page.css('div.articleContent p img')
      all_images_header = page.css('div.articleContent h2')
      contents = []
      all_images.each_with_index do|value, index| 
        content = {}
        content[:title] = all_images_header[index]
        content[:img] = value['src']
        contents << content
      end
      
      contents 
    end
  end
end
