class BrowseGenesController < ApplicationController
  def show
    @comparison = Comparison.find(params[:comparison_id])
    @experiment = Experiment.find(params[:experiment_id])
    @gene       = Gene.find(params[:id])
  end
end
