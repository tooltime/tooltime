class TranscriptionFactorsController < ApplicationController
  def index
    @factors = TranscriptionFactor.all
  end
end
