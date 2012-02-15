class DataController < ApplicationController
  def upload
    file = params[:data]
    @filename = file.original_filename
    Delayed::Job.enqueue(Uploader.new(file.tempfile.path))
  end
end
