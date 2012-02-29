class BrowseRegulatoryElementsController < ApplicationController
  def show
    @comparison = Comparison.find(params[:comparison_id])
    @experiment = Experiment.find(params[:experiment_id])
    @gene       = Gene.find(params[:gene_id])
    @re_element = RegulatoryElement.find(params[:id])
    @t_factors  = sorted_collection(@re_element.transcription_factors)
  end
end
