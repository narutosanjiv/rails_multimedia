module Webscraper 
  class YouTube
    def search(url)
      search_results = []
      page = Nokogiri::HTML(open(web_url))
      page.search('#search-results li').each do|div_li|
        a = {}
        a['img_src'] = div_li.search('div a span span span span img')['src'] 
        a['content_title'] = div_li.search('div.yt-lockup2-content .yt-lockup2-title a').text()
        a['content_meta'] = div_li.search('div.yt-lockup2-content .yt-lockup2-meta yt-lockup2-meta-info')
      end
    end
          
  end
end
