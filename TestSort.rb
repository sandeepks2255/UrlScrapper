require 'minitest/autorun'
require './MergeSort'
require "minitest/pride"
require "webmock/minitest"

class TestSort < Minitest::Test
    def setup
        @array=MergeSort.new
        @result=@array.sort(['z','a'])
        @correct=['a','z']
    end
    def test_is_file_sorted
        assert_equal @correct,@result
    end
end