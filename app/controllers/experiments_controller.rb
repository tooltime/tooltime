class ExperimentsController < ApplicationController
  def show
    @comparison = Comparison.find(params[:comparison_id])
    @experiment = Experiment.find(params[:id])
    @genes      = sorted_collection(filtered_genes(@experiment))
  end
  
  private
  
  def filtered_genes(experiment)
    if params[:regulation].nil?
      experiment.genes
    else
      experiment.genes.where(:regulation => params[:regulation])
    end
  end
end
