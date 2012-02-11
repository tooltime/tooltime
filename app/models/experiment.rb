class Experiment < ActiveRecord::Base
  belongs_to :comparison
  has_many   :genes  
end
