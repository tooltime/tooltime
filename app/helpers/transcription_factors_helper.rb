module TranscriptionFactorsHelper

  #Count the number of unique genes the given transcription factor appears in
  def count_genes(factor)
    factor.regulatory_elements.map {|reg| reg.gene_id}.to_set.count
  end

  #Count the total number of times the given transcription factor appears in the DB
  def count_total(factor)
    factor.regulatory_elements.count
  end

  #These methods belong in the regulatory_elements_helper file which is not created yet.
  #Move them as soon as one is created!!

  #Get a given regulatory element's Comparison
  def get_comparison(regulatory_element)
    Comparison.find(Experiment.find(Gene.find(regulatory_element.gene_id).experiment_id).comparison_id)
  end

  #Get a given regulatory element's Experiment
  def get_experiment(regulatory_element)
    Experiment.find(Gene.find(regulatory_element.gene_id).experiment_id)
  end

  #Get a given regulatory element's Gene
  def get_gene(regulatory_element)
    Gene.find(regulatory_element.gene_id)
  end

end
