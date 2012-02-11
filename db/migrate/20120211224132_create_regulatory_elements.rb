class CreateRegulatoryElements < ActiveRecord::Migration
  def change
    create_table :regulatory_elements do |t|
      t.integer :beg
      t.integer :len
      t.string :sns
      t.string :model
      t.string :sequence
      t.float :la
      t.float :la_slash
      t.float :lq
      t.float :ld
      t.float :ppv

      t.timestamps
    end
  end
end
