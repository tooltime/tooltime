class MoveTessFromExperimentsToGenes < ActiveRecord::Migration
  def up
    change_table :experiments do |t|
      t.remove :tess
    end
    change_table :genes do |t|
      t.string :tess
    end
  end

  def down
    change_table :genes do |t|
      t.remove :tess
    end
    change_table :experiments do |t|
      t.string :tess
    end
  end
end
