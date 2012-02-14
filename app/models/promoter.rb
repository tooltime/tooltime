class Promoter < ActiveRecord::Base
  belongs_to :gene
  
  validates_uniqueness_of :sequence
end
