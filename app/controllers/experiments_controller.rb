class ExperimentsController < ApplicationController
  def show
    @comparison = Comparison.find(params[:comparison_id])
    @experiment = Experiment.find(params[:id])
    @genes      = sorted_collection(@experiment.genes)
  end
end
