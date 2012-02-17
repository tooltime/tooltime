class ChangeSequenceTypeInPromoter < ActiveRecord::Migration
  def up
    change_column :promoters, :sequence, :text
  end

  def down
    change_column :promoters, :sequence, :string
  end
end
