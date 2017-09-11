require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require './DownloadFile'
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

@process_file=ProcessFile.new
@process_file.unzip("zipfile","/home/sandeep/Desktop/ruby/minitest")

