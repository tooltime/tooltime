class Comparison < ActiveRecord::Base
  has_many :experiments, :dependent => :destroy
  
  validates_uniqueness_of :state, :scope => [:species, :cell_type]
end
