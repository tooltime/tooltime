class GeneSearchController < ApplicationController
  def index
    @tfnames = TranscriptionFactor.select(:name).uniq.map(&:name)
  end
end
