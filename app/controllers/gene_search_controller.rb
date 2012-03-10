class GeneSearchController < ApplicationController
  def index
    @tfnames         = TranscriptionFactor.select(:name).uniq.map(&:name)
    @all_species     = Comparison.all_species
    @all_experiments = Experiment.select(:label).uniq.map(&:label)
    @all_comparisons = Comparison.select(:state).uniq.map(&:state)
  end
  
  def search
    search = GeneSearch.new(params[:tfactors])
    search.run
    @genes = search.results
  end
end
