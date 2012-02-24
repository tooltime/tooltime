require 'fileutils'

class Uploader
  def initialize
    @files = []
  end
  
  def add_uploaded_file(filename, contents)
    @files << {name: filename, contents: contents}
  end
    
  def perform
    @files.sort{|a,b| a[:name] <=> b[:name]}.each_slice(3) do |csvs|
      csv_data = csvs.map {|triplet| triplet[:contents]}
      Importer.new(*csv_data).import!
    end
  end
end
