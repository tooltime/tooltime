require 'fileutils'

class DataController < ApplicationController
  def upload
    uploader = Uploader.new
    files = params[:data]
    files.each {|f| uploader.add_uploaded_file(f.original_filename, f.read)}
    job = Delayed::Job.enqueue(uploader)
    @job_id = job.id
  end
  
  def status
    resp = {:status => 'working'}
    job = Delayed::Job.find_by_id(params[:job_id])
    if job.nil?
      resp[:status] = 'done'
    else
      unless job.last_error.nil?
        resp[:status] = 'error'
      end
    end
    render :json => resp
  end
end
