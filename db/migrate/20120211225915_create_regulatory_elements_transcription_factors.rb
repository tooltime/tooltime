class CreateRegulatoryElementsTranscriptionFactors < ActiveRecord::Migration
  def up
    create_table :regulatory_elements_transcription_factors do |t|
      t.integer :regulatory_element_id
      t.integer :transcription_factor_id
    end 
  end

  def down
    drop_table :regulatory_elements_transcription_factors
  end
end
