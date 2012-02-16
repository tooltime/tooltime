require 'fileutils'

class DataController < ApplicationController
  def upload
    files = params[:data]
    uploader = Uploader.new
    copy_uploaded_files uploader, files
    job = Delayed::Job.enqueue(uploader)
    @job_id = job.id
  end
  
  private
  
  def copy_uploaded_files(uploader, files)
    files.each {|f| FileUtils.cp(f.tempfile, File.join(uploader.dir, f.original_filename))}
  end
end
