require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require './MergeSort'
class CreateFile
    def initialize(temp)
        File.open("newfile.txt","w") do |f|
            f.puts temp
        end
    end
end
CreateFile.new($data)