class TranscriptionFactorsController < ApplicationController
  def index
    @factors = TranscriptionFactor.all
    sort = params[:sort]

    case sort
      when "id", "name"
        @factors = TranscriptionFactor.order(sort)
      when "fac"
      when "modelCount"
      when "geneCount"
        @factors = TranscriptionFactor.joins(:regulatory_elements => :gene).group("transcription_factors.id").order("count(DISTINCT genes.id) asc")
      when "totalCount"
        @factors = TranscriptionFactor.joins(:regulatory_elements).group("transcription_factors.id").order("count(regulatory_elements.id) asc")
      else
    end
  end

  def show
    @factor = TranscriptionFactor.find(params[:id])
    @regulatoryElements = @factor.regulatory_elements
    sort = params[:sort]

    case sort 
      when "state"
        @regulatoryElements = @regulatoryElements.joins(:gene => {:experiment => :comparison}).find(:all, :order => sort)
      when "label", "tess"
        @regulatoryElements = @regulatoryElements.joins(:gene => :experiment).find(:all, :order => sort)
      when "name" 
        @regulatoryElements = @regulatoryElements.joins(:gene).find(:all, :order => sort)
      when "beg", "model"
        @regulatoryElements = @regulatoryElements.order(sort)
      else
    end
  end
end
