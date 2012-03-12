class AddCountsToFactors < ActiveRecord::Migration
  def change
    change_table :transcription_factors do |t|
      t.integer :genes_count
      t.integer :totals_count
      t.integer :models_count
    end
  end
end
