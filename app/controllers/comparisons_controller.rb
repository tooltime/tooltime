class ComparisonsController < ApplicationController
  def index
    @species_opts = Comparison.all_species.map {|s| [s, s]}
    @comparisons  = sorted_collection(filtered_comparisons)
  end
  
  def show
    @comparison = Comparison.find(params[:id])
  end
  
  private
  
  def filtered_comparisons
    params[:species].nil? ? Comparison.all : Comparison.where(species: params[:species])
  end
end
