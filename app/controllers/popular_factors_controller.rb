class PopularFactorsController < ApplicationController
  def index
    @species = Comparison.all_species
  end

  def search
  end
end
