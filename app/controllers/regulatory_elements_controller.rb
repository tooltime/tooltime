class RegulatoryElementsController < ApplicationController
   def index
      @regulatory_elements = sorted_collection(RegulatoryElement.paginate(:page => params[:page], :per_page => 100))
   end
   
  def show 
    @regulatory_element = RegulatoryElement.find(params[:id])  
  end
  
  def edit
    @regulatory_element = RegulatoryElement.find(params[:id])
  end
  
  def update
    regulatory_element = RegulatoryElement.find(params[:id])
    regulatory_element.update_attributes(params[:regulatory_element])
    flash[:notice] = 'Regulatory Element updated successfully.'
    redirect_to regulatory_element
  end
end
