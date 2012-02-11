class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :label
      t.string :tess

      t.timestamps
    end
  end
end
