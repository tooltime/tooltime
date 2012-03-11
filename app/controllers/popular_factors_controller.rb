class PopularFactorsController < ApplicationController
  def index
    @species     = Comparison.all_species
    @comparisons = Comparison.all
    @experiments = Experiment.all
  end

  def search
    constraints = params.reject {|k,v| k == 'species' || k == 'experiments'}
    search = FactorPopularity.new(params[:experiments], constraints)
    search.run
    @factors = search.results
  end
end
