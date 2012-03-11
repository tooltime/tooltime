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
    constraints = params.reject {|k,v| k == 'species' || k == 'experiments' || k == 'sort_by'}
    search = FactorPopularity.new(params[:experiments], constraints)
    search.run
    factors = sorted_results(search.results)
    render :json => {factors: factors}
  end
  
  private
  
  def sorted_results(factors)
    sort_by = params[:sort_by]
    order   = params[:order]
    
    if sort_by == 'total'
      if order == 'asc'
        factors.to_a.sort {|a,b| a.last[:total] <=> b.last[:total]}
      elsif order == 'desc'
        factors.to_a.sort {|a,b| b.last[:total] <=> a.last[:total]}
      end
    elsif sort_by == 'genes'
      if order == 'asc'
        factors.to_a.sort {|a,b| a.last[:genes].size <=> b.last[:genes].size}
      elsif order == 'desc'
        factors.to_a.sort {|a,b| b.last[:genes].size <=> a.last[:genes].size}
      end
    elsif sort_by == 'name'
      if order == 'asc'
        factors.to_a.sort {|a,b| a.first <=> b.first}
      elsif order == 'desc'
        factors.to_a.sort {|a,b| b.first <=> a.first}
      end
    end
  end
end
