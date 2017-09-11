require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require './ProcessFile'
class ProcessCSV
    def display
        @temp="#{$csv_file}"
        i=1
        list=[]
        CSV.foreach(@temp) do |row| 
        list << row[1]
        i=i+1
        break if (i==15)
        end  
       return  list
    end
end

@process_csv=ProcessCSV.new
$list=@process_csv.display

