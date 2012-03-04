class Gene < ActiveRecord::Base
  belongs_to :experiment
  has_one :promoter
  has_many :regulatory_elements
  validates_uniqueness_of :name, :scope => [:species, :experiment_id]
  
  def update_num_factors
    num_factors = self.regulatory_elements.reduce(0) {|sum, re| sum + re.transcription_factors.size}
    self.update_attributes(:num_factors => num_factors)
  end

  def num_experiments_all
  	Gene.where(:name => self.name).map(&:experiment).uniq.size  	
  end

  def num_experiments_up
  	Gene.where(:name => self.name, :regulation => 'up').map(&:experiment).uniq.size  	
  end

  def num_experiments_down
  	Gene.where(:name => self.name, :regulation => 'down').map(&:experiment).uniq.size  	
  end

  def get_experiments
  	Gene.where(:name => self.name).map(&:experiment)
  end

  def num_comparisons_all
    Gene.where(:name => self.name).map {|g| g.experiment.comparison}.uniq.size  
  end

  def num_comparisons_up
    Gene.where(:name => self.name, :regulation => 'up').map {|g| g.experiment.comparison}.uniq.size    
  end

  def num_comparisons_down
    Gene.where(:name => self.name, :regulation => 'down').map {|g| g.experiment.comparison}.uniq.size    
  end


end

