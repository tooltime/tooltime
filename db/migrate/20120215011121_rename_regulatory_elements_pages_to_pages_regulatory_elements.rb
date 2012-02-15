class RenameRegulatoryElementsPagesToPagesRegulatoryElements < ActiveRecord::Migration
  def change
    rename_table :regulatory_elements_pages, :pages_regulatory_elements
  end
end
