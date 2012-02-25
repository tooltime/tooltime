class ExperimentsController < ApplicationController
  def index
    # TODO
  end

  def show
    @comparison = Comparison.find(params[:comparison_id])
    @experiment = Experiment.find(params[:id])
  end
end
