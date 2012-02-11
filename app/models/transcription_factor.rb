class TranscriptionFactor < ActiveRecord::Base
  has_and_belongs_to_many :regulatory_elements
end
