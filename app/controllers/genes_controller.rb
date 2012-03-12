class GenesController < ApplicationController
  def index
    @genes = sorted_collection(Gene.paginate(:page => params[:page], :per_page => 100))
  end
  
  def show
    @gene = Gene.find(params[:id])    
  end
  
  def edit
    @gene = Gene.find(params[:id])
  end
  
  def update
    gene = Gene.find(params[:id])
    gene.update_attributes(params[:gene])
    flash[:notice] = 'Gene updated successfully.'
    redirect_to gene
  end
end
