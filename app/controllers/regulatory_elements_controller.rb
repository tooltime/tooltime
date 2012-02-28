class RegulatoryElementsController < ApplicationController
   def index
      @regulatory_elements = RegulatoryElement.all
   end
end
