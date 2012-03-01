class GenesController < ApplicationController
  def index
    @genes = sorted_collection(Gene.all)
  end
end 