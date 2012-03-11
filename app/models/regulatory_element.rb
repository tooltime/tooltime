class RegulatoryElement < ActiveRecord::Base
  belongs_to :gene
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :transcription_factors
  
  validates_uniqueness_of :gene_id, :scope => [:beg, :len, :sns, :model]
  
  def self.all_senses
    self.select(:sns).uniq.map(&:sns)
  end
  
  def similar
    RegulatoryElement.where('id != ?', self.id).where(:gene_id => self.gene_id, :beg => self.beg, :sns => self.sns, :len => (self.len - 1)..(self.len + 1))
  end
end
