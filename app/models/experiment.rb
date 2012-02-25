class Experiment < ActiveRecord::Base
  belongs_to :comparison
  has_many   :genes
  validates_uniqueness_of :label, :scope => :tess
end
