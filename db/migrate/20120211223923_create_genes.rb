class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :abbrev
      t.string :name
      t.string :species
      t.integer :chromosome
      t.integer :beg_site
      t.integer :end_site
      t.string :regulation
      t.string :length
      t.string :email
      t.integer :transfac_strs
      t.integer :mysite_strs
      t.integer :selected_one
      t.integer :transfac_matrices
      t.integer :imd_matrices
      t.integer :cbil_matrices
      t.integer :jaspar_matrices
      t.integer :myweight_matrices
      t.integer :selected_two
      t.string :combine
      t.string :factor_attribute_one
      t.string :matches
      t.integer :core_positions
      t.integer :tmm
      t.integer :ts_a
      t.integer :tw
      t.integer :ta
      t.string :group_selection_one
      t.integer :td
      t.float :tc
      t.float :tm
      t.integer :lg_likelihood_deficit
      t.float :sig_threshold
      t.integer :selected_three
      t.float :pseudo_counts
      t.string :group_selection_two
      t.integer :a_tcontent
      t.float :a_distribution
      t.float :c_distribution
      t.float :t_distribution
      t.float :g_distribution
      t.string :ambiguous

      t.timestamps
    end
  end
end
