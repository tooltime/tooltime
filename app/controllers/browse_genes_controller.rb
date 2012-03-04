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
    elsif params[:la_slash]
      elements.where("la_slash >= ?", params[:la_slash])
    elsif params[:la_slash_low] && params[:la_slash_high]
      elements.where("la_slash >= :la_slash_low AND la_slash <= :la_slash_high",
                     {:la_slash_low => params[:la_slash_low], :la_slash_high => params[:la_slash_high]})
    elsif params[:lq]
      elements.where("lq >= ?", params[:lq])
    elsif params[:lq_low] && params[:lq_high]
      elements.where("lq >= :lq_low AND lq <= :lq_high",
                     {:lq_low => params[:lq_low], :lq_high => params[:lq_high]})
    elsif params[:ld]
      elements.where("ld >= ?", params[:ld])
    elsif params[:ld_low] && params[:ld_high]
      elements.where("ld >= :ld_low AND ld <= :ld_high",
                     {:ld_low => params[:ld_low], :ld_high => params[:ld_high]})
    else
      elements
    end
  end
end
