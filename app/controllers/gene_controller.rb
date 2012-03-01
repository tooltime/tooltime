class GenesController < ApplicationController
  def index
    @genes = GeneController.all
  end
end
