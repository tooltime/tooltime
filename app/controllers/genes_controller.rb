class GenesController < ApplicationController
  def index
    @genes = Gene.all
    sort = params[:sort]

    case sort
    	when "id"
    		@genes = Gene.order(sort)
    	when "species"
    		@genes = Gene.order(sort)
    	when "name"
    		@genes = Gene.order(sort)
    	when "abbrev"
    		@genes = Gene.order(sort)
    	when "chromosome"
    		@genes = Gene.order(sort)
    	when "beg_site"
    		@genes = Gene.order(sort)
    	when "end_site"
    		@genes = Gene.order(sort)   		
    end    	
  end
end 