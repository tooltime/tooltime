class BrowseGenesController < ApplicationController
  def show
    @comparison   = Comparison.find(params[:comparison_id])
    @experiment   = Experiment.find(params[:experiment_id])
    @gene         = Gene.find(params[:id])
    @reg_elements = sorted_collection(filtered_elements(@gene.regulatory_elements))
  end
  
  private
  
  def filtered_elements(elements)
    if params[:la]
      elements.where("la >= ?", params[:la])
    elsif params[:la_low] && params[:la_high]
      elements.where("la >= :la_low AND la <= :la_high",
                     {:la_low => params[:la_low], :la_high => params[:la_high]})
    else
      elements
    end
  end
end
