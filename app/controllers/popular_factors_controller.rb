class PopularFactorsController < ApplicationController
  def index
    @species     = Comparison.all_species
    @comparisons = Comparison.all
    @experiments = Experiment.all
  end

  def search
  end
end
