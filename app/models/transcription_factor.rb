class TranscriptionFactor < ActiveRecord::Base
  has_and_belongs_to_many :regulatory_elements
  
  validates_uniqueness_of :name

   #Count the number of unique genes the given transcription factor appears in
  def count_genes()
    self.regulatory_elements.map {|reg| reg.gene_id}.to_set.count
  end

  #Count the total number of times the given transcription factor appears in the DB
  def count_total()
    self.regulatory_elements.count
  end

  #Count the total unique number of models in which this transcription factor was found
  def count_models()
    self.regulatory_elements.count(:select => "distinct regulatory_elements.model")
  end
  
  def update_counts
    self.update_attributes(genes_count: self.count_genes, totals_count: self.count_total, models_count: self.count_models)
  end

  def num_occurences(gene)

      gene_array = TranscriptionFactor.where(:name => self.name).first.regulatory_elements.map(&:gene)

      counter = 0
      gene_array.each do |g|
        if g.name == gene.name
          counter += 1
        end
      end
      counter
    end
end
