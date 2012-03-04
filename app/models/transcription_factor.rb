class TranscriptionFactor < ActiveRecord::Base
  has_and_belongs_to_many :regulatory_elements
  
  validates_uniqueness_of :name

   #Count the number of unique genes the given transcription factor appears in
  def count_genes()
    self.regulatory_elements.map {|reg| reg.gene_id}.to_set.count
  end

  #Count the total number of times the given transcription factor appears in the DB
  def count_total()
    self.regulatory_elements.count
  end

  #Count the total unique number of models in which this transcription factor was found
  def count_models()
    self.regulatory_elements.count(:select => "distinct regulatory_elements.model")
  end

end
