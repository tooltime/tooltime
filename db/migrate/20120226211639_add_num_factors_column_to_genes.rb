class AddNumFactorsColumnToGenes < ActiveRecord::Migration
  def change
    add_column :genes, :num_factors, :integer
  end
end
