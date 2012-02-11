class CondenseComparisonStates < ActiveRecord::Migration
  def up
    change_table :comparisons do |t|
      t.remove :to_state
      t.rename :from_state, :state
    end
  end

  def down
    change_table :comparisons do |t|
      t.rename :state, :from_state
      t.add :to_state
    end
  end
end
