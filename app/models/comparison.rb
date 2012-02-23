class Comparison < ActiveRecord::Base
  has_many :experiments, :dependent => :destroy
  validates_uniqueness_of :state, :scope => [:species, :cell_type]
  
  # returns unique values of species for all comparisons
  def self.all_species
    self.select('*').group(:species).map(&:species)
  end
end
