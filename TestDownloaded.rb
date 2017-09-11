require 'minitest/autorun'
require './pgmtounzip'
require "minitest/pride"
require "webmock/minitest"

class TestDownloaded < Minitest::Test
    def setup
        url = "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip"
        @download = DownloadFile.new(url)
        FileUtils.rm('top-domain') if File.exist?("top-domain")
        stub_request(:any, url).to_return(status: 200,body:  File.read("./zipfile"),headers: {"Content-Type" => 'application/octet-stream'} )
    end
    def test_downloading_a_file    
        @download.fetch
         assert_equal File.exist?("./zipfile"), true  
    end
    
 end
 