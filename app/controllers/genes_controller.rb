class GenesController < ApplicationController
  
  def index
    @genes = sorted_collection(Gene.all)
  end

  def show
    @gene = Gene.find(params[:id])    
  end

end 