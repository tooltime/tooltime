class RegulatoryElement < ActiveRecord::Base
  belongs_to :gene
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :transcription_factors
end
