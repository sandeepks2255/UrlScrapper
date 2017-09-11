
require 'minitest/autorun'
require './pgmtounzip'
require "minitest/pride"
require "webmock/minitest"

class DownloadTest < Minitest::Test
    def setup
        url = "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip"
        @download = DownloadFile.new(url)
        FileUtils.rm('top-domain') if File.exist?("top-domain")
        stub_request(:any, url).to_return(status: 200,body:  File.read("./top-1m.csv"),headers: {"Content-Type" => 'application/octet-stream'} )
    end
    def test_downloading_a_file    
        @download.fetch
         assert_equal File.exist?("./top-1m.csv"), true  
    end
    
 end

class Testextracted < Minitest::Test
    def test_extracted
        assert File.exists? "/home/sandeep/Desktop/ruby/minitest/top-1m.csv"
    end
end
class TestCreatedFile < Minitest::Test
    def test_created
        assert File.exists? "/home/sandeep/Desktop/ruby/minitest/newfile.txt"
    end
end

