
require 'minitest/autorun'
require './pgmtounzip'
require "minitest/pride"
require "webmock/minitest"

class DownloadTest < Minitest::Test
    def setup
        url = "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip"
        top-domain="/home/sandeep/Desktop/ruby/minitest/top-1m.csv"
        @download = DownloadFile.new(url)
        FileUtils.rm('top-domain') if File.exist?("top-domain")
        stub_request(:any, url).to_return(status: 200,body:  File.read("./top-domain"),headers: {"Content-Type" => 'application/octet-stream'} )
    end
    def test_downloading_a_file    
        @download.file   
         assert_equal File.exist?("./top-domain"), true  
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
class SortedOrNot < Minitest::Test
    def sorted
        assert_empty Array, MergeSort::list
    end
end
