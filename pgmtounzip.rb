require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'

class DownloadFile
    def initialize(url)
        @url = url
    end
    def fetch
        Net::HTTP.start("s3.amazonaws.com") { |http|
            puts"downloading"
            content = http.get(@url)
            File.open("zipfile", "w"){ |file|
                file.write(content.body)
                puts"DOWNLOADED"
            }
        }
    end
end

class ProcessFile
    def unzip(file,destination)
        Zip::File.open(file)do |zip_file|
             zip_file.each do |f|
                f_path = File.join(destination, f.name)
                FileUtils.mkdir_p(File.dirname(f_path))
                f.extract(f_path)unless File.exist?(f_path)
                $csv_file=f
                puts "UNZIPPED"
            end
        end
    end
end

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
        puts list  
       return  @temp_display=list
    end
end

class MergeSort
    def sort(numbers)
        if numbers.size <= 1
            return numbers
        end
        array_size   = numbers.size
        half_of_size = (array_size / 2).round
    
        left_array  = numbers.take(half_of_size)
        right_array = numbers.drop(half_of_size)
    
        sorted_left_array = sort(left_array)
        sorted_right_array = sort(right_array)
    
        merge(sorted_left_array, sorted_right_array)
    end 
    def merge(left_array, right_array)
        if right_array.empty?
            return left_array 
        end
    
        if left_array.empty?
            return right_array 
        end
    
        smallest_number = if left_array.first <= right_array.first
            left_array.shift
        else
            right_array.shift
        end
         recursive = merge(left_array, right_array)
        [smallest_number].concat(recursive)
    end
end

class CreateFile
    def initialize(temp)
        File.open("newfile.txt","w") do |f|
            f.puts temp
        end
    end
end


@download_file=DownloadFile.new("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
@download_file.fetch
@process_file=ProcessFile.new
@process_file.unzip("zipfile","/home/sandeep/Desktop/ruby/minitest")
@process_csv=ProcessCSV.new
list=@process_csv.display

puts "----------after sorting---------"
@merge_sort = MergeSort.new
puts data=@merge_sort.sort(list)
CreateFile.new(data)
