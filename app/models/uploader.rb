require 'fileutils'

class Uploader
  def initialize
    FileUtils.mkdir dir
  end
  
  def dir
    Rails.root.join('tmp', 'data')
  end
  
  def perform
    Rails.logger.debug "[UPLOADER] Uploader started...\n"
    parse_data
    remove_uploaded_data
    Rails.logger.debug "\n[UPLOADER] Uploader finished."
  end
  
  private
  
  def remove_uploaded_data
    FileUtils.rm_r dir
  end
  
  def parse_data
    Dir[File.join(dir, '*.csv')].sort.each_slice(3) do |triplet|
      Rails.logger.debug "[UPLOADER] parsing data set..."
      triplet.each do |f|
        Rails.logger.debug "[UPLOADER]\t#{File.split(f).last}"
      end
      Importer.new(*triplet).import!
      Rails.logger.debug "[UPLOADER] ...done"
    end
  end
end
