# require 'csv'
# require 'rubygems'
# require 'zip'
# require 'net/http'

# class DownloadFile

#     def initialize(url)
#         @url = url
#     end

#     def fetch
#         Net::HTTP.start("s3.amazonaws.com") { |http|
#             puts"downloading"
#             content = http.get(@url)
#             File.open("zipfile", "w"){ |file|
#                 file.write(content.body)
#                 puts"DOWNLOADED"
#             }
#         }
#     end
# end

# @download_file=DownloadFile.new("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
# @download_file.fetch

