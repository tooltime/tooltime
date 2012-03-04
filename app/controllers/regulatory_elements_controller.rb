class RegulatoryElementsController < ApplicationController
   def index
      @regulatory_elements = sorted_collection(RegulatoryElement.all)
   end
end
