require 'cgi'
module youtube
  module downloader 

    def video_token(video_id)
      response = CGI.parse(%x!curl http://www.youtube.com/get_video_info?video_id=#{video_id}!)
      if response['status'] == ['fail']
        puts "Error! #{response['reason']}" 
      else
        return response['token'][0]
      end
    end

    def video_id(url)
      CGI.parse(url.split('?')[1])['v'][0]
    end

    url = ARGV[0]
    download = "http://youtube.com/get_video?t=#{video_token(video_id(url))}&video_id=#{video_id(url)}&asv=2"

   %x!/usr/bin/env curl -L -C - -o #{video_id(url)} '#{download}'!

  end 
end
