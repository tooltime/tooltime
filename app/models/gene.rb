class Gene < ActiveRecord::Base
  belongs_to :experiment
  has_one :promoter
  has_many :regulatory_elements
end
