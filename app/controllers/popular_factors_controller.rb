class PopularFactorsController < ApplicationController
  def index
    @species     = Comparison.all_species
    @comparisons = Comparison.all
    @experiments = Experiment.all
  end

  def search
    @params = params
  end
  
  def results
    constraints = params.reject {|k,v| k == 'species' || k == 'experiments'}
    search = FactorPopularity.new(params[:experiments], constraints)
    search.run
    factors = search.results
    render :json => {factors: factors}
  end
end
