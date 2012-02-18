class Importer  
  def initialize(hits_file, jobs_file, seqs_file)
    @cp = Parsers::ComparisonParser.new(jobs_file)
    @ep = Parsers::ExperimentParser.new(jobs_file)
    @gp = Parsers::GeneParser.new(jobs_file)
    @pp = Parsers::PromoterParser.new(seqs_file)
    @rp = Parsers::RegulatoryElementParser.new(hits_file)
  end
  
  def import!
    comparison = @cp.import
    experiment = @ep.import
    gene = @gp.import
    promoter = @pp.import
    reg_elements = @rp.import
    
    gene.promoter = promoter
    reg_elements.each {|re| gene.regulatory_elements << re}
    experiment.genes << gene
    comparison.experiments << experiment
  end
  
  # for testing only
  def self.test!
    test_data = File.join(Rails.root, 'tmp', 'ExperimentData')
    hits = File.join(test_data, 'bACO2 promoter TESS Hits 1.csv')
    jobs = File.join(test_data, 'bACO2 promoter TESS Job Parameters.csv')
    seqs = File.join(test_data, 'bACO2 promoter TESS Sequences.csv')
    self.new(hits, jobs, seqs).import!
  end
end
