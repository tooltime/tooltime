class Experiment < ActiveRecord::Base
  belongs_to :comparison
  has_many   :genes
  validates_uniqueness_of :label
  
  def identified(regulation=nil)
    if regulation.nil?
      self.genes.size
    elsif regulation == :up
      self.genes.select{|g| g.regulation == 'up'}.size
    elsif regulation == :down
      self.genes.select{|g| g.regulation == 'down'}.size
    end
  end
end
