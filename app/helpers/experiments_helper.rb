module ExperimentsHelper

  def count_genes(factor)
    factor.regulatory_elements.map {|reg| reg.gene_id}.to_set.count
  end
end
