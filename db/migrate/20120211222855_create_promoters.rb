class CreatePromoters < ActiveRecord::Migration
  def change
    create_table :promoters do |t|
      t.string :sequence

      t.timestamps
    end
  end
end
