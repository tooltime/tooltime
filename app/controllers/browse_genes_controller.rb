class BrowseGenesController < ApplicationController
  def show
    @comparison   = Comparison.find(params[:comparison_id])
    @experiment   = Experiment.find(params[:experiment_id])
    @gene         = Gene.find(params[:id])
    @reg_elements = sorted_collection(@gene.regulatory_elements)
  end
end
