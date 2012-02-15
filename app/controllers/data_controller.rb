class DataController < ApplicationController
  def upload
    file = params[:data]
    @filename = file.original_filename
  end
end
