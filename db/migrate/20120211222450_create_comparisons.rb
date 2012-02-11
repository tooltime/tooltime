class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.string :from_state
      t.string :to_state
      t.string :species
      t.string :cell_type

      t.timestamps
    end
  end
end
