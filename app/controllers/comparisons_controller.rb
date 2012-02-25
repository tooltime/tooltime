class ComparisonsController < ApplicationController
  def index
    @species_opts = Comparison.all_species.map {|s| [s, s]}
    if params[:species].nil?
      @comparisons = Comparison.all
    else
      @selected_species = params[:species]
      @comparisons = Comparison.where(:species => @selected_species)
    end
  end
  
  def show
    @comparison = Comparison.find(params[:id])
  end
end
