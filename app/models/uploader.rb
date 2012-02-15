require 'fileutils'
require 'zip/zip'

class Uploader
  def initialize(tmp_path)
    @path = Rails.root.join('tmp', 'data', 'data.zip')
    FileUtils.cp tmp_path, @path
  end
  
  def perform
    Rails.logger.debug '[UPLOADER] uploader started...'
    process!
    Rails.logger.debug '[UPLOADER] uploader finished.'
  end
  
  def process!
    Zip::ZipFile.foreach(@path) do |file|
      Rails.logger.debug "[UPLOADER] #{file.inspect}"
    end
  end
end
