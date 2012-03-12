class TranscriptionFactorsController < ApplicationController
  def index
    @factors = sorted_collection(TranscriptionFactor.paginate(:page => params[:page], :per_page => 100))
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

  def edit
    @factor = TranscriptionFactor.find(params[:id])
  end

  def update
    factor = TranscriptionFactor.find(params[:id])
    factor.update_attributes(params[:transcription_factor])
    flash[:notice] = 'Transcription Factor updated successfully.'
    redirect_to factor
  end
end
