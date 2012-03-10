class GeneSearchController < ApplicationController
  def index
    @tfnames     = TranscriptionFactor.select(:name).uniq.map(&:name)
    @all_species = Comparison.all_species
  end
end
