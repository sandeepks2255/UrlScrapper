require 'minitest/autorun'
require './CreateFile'
require "minitest/pride"
require "webmock/minitest"
class TestCreateFile < Minitest::Test
    def test_create_file
        assert_equal File.exist?("./newfile.txt"), true
    end
end
