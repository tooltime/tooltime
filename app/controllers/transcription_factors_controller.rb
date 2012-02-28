class TranscriptionFactorsController < ApplicationController
  def index
    @factors = TranscriptionFactor.all
  end

  def show
    @factor = TranscriptionFactor.find(params[:id])
  end
end
