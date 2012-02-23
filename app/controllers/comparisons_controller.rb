class ComparisonsController < ApplicationController
  def index
    @comparisons  = Comparison.all
    @species_opts = Comparison.all_species.map {|s| [s, s]}
  end
end
