class GenesController < ApplicationController
  def index
    @genes = Gene.all
  end
end
