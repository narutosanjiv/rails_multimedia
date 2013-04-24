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
        content[:title] = all_images_header[index].text()
        content[:img] = value['src']
        info_element = all_images_header[index].next_element().next_element()        
        info_text = ""
        while 1
          if info_element and info_element.name != "h2" and info_element.children()[0]
            info_text = info_text + info_element.text()
            info_element = info_element.next_element() 
          else
            break
          end
        end
        content[:info] = info_text
        contents << content
      end
      
      contents 
    end
  end
end
