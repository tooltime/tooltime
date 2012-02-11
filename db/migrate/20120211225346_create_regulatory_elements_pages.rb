class CreateRegulatoryElementsPages < ActiveRecord::Migration
  def up
    create_table :regulatory_elements_pages do |t|
      t.integer :regulatory_element_id
      t.integer :page_id
    end 
  end

  def down
    drop_table :regulatory_elements_pages
  end
end
