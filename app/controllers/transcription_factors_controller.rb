class TranscriptionFactorsController < ApplicationController
  def index
    @factors = TranscriptionFactor.all
    sort = params[:sort].to_s
    dir  = params[:order].to_s

    case sort
      when "id", "name"
        @factors = TranscriptionFactor.order("#{sort} #{dir}")
      when "fac"
      when "modelCount"
      when "geneCount"
        @factors = TranscriptionFactor.joins(:regulatory_elements => :gene).group("transcription_factors.id").order("count(DISTINCT genes.id) #{dir}")
      when "totalCount"
        @factors = TranscriptionFactor.joins(:regulatory_elements).group("transcription_factors.id").order("count(regulatory_elements.id) #{dir}")
      else
    end
  end

  def show
    @factor = TranscriptionFactor.find(params[:id])
    @regulatoryElements = @factor.regulatory_elements
    sort = params[:sort].to_s
    dir = params[:order].to_s

    case sort 
      when "state"
        @regulatoryElements = @regulatoryElements.joins(:gene => {:experiment => :comparison}).find(:all, :order => "#{sort} #{dir}")
      when "label", "tess"
        @regulatoryElements = @regulatoryElements.joins(:gene => :experiment).find(:all, :order => "#{sort} #{dir}")
      when "name" 
        @regulatoryElements = @regulatoryElements.joins(:gene).find(:all, :order => "#{sort} #{dir}")
      when "beg", "model"
        @regulatoryElements = @regulatoryElements.order("#{sort} #{dir}")
      else
    end
  end
end
