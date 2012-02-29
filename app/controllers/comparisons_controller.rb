class ComparisonsController < ApplicationController
  def index
    @species_opts = Comparison.all_species.map {|s| [s, s]}
    @comparisons  = sorted_collection(filtered_comparisons)
  end
  
  def show
    @comparison  = Comparison.find(params[:id])
    @experiments = sorted_experiments(@comparison.experiments)
  end
  
  private
  
  def filtered_comparisons
    params[:species].nil? ? Comparison.all : Comparison.where(species: params[:species])
  end
  
  def sorted_experiments(experiments)
    if params[:sort] =~ /genes_identified_/ && experiments.size > 1
      i_by = params[:sort].split('_').last
      dir = params[:sort].split('_').last.to_sym
      dir = nil if i_by == 'total'
      if params[:order] == 'asc'
        experiments.sort_by {|a,b| a.identified(dir) <=> b.identified(dir)}
      elsif params[:order] == 'desc'
        experiments.sort_by {|a,b| b.identified(dir) <=> a.identified(dir)}
      end
    elsif params[:sort] =~ /genes_identified_/ && experiments.size <= 1
      experiments
    else
      sorted_collection(experiments)
    end
  end
end
