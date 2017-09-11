require 'minitest/autorun'
require './ProcessFile'
require "minitest/pride"
require "webmock/minitest"
class Testextracted < Minitest::Test
    def test_extracted
        assert_equal File.exist?("./top-1m.csv"), true
    end
end
