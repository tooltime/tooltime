class Gene < ActiveRecord::Base
  belongs_to :experiment
  has_one :promoter
  has_many :regulatory_elements
  validates_uniqueness_of :name, :scope => :species
  
  def num_factors
    self.regulatory_elements.reduce(0) {|sum, re| sum + re.transcription_factors.size}
  end
end
