class AddForeignKeys < ActiveRecord::Migration
  def up
    add_column :experiments, :comparison_id, :integer
    add_column :genes, :experiment_id, :integer
    add_column :promoters, :gene_id, :integer
    add_column :regulatory_elements, :gene_id, :integer
  end

  def down
    remove_column :experiments, :comparison_id
    remove_column :genes, :experiment_id
    remove_column :promoters, :gene_id
    remove_column :regulatory_elements, :gene_id
  end
end
