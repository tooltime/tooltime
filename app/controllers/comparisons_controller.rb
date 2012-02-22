class ComparisonsController < ApplicationController
  def index
    @comparisons = Comparison.all
  end
end
