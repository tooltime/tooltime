class RegulatoryElement < ActiveRecord::Base
  belongs_to :gene
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :transcription_factors
  
  validates_uniqueness_of :gene_id, :scope => [:beg, :len, :sns, :model]
  
  def self.all_senses
    self.select(:sns).uniq.map(&:sns)
  end
end
