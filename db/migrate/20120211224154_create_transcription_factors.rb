class CreateTranscriptionFactors < ActiveRecord::Migration
  def change
    create_table :transcription_factors do |t|
      t.string :name

      t.timestamps
    end
  end
end
