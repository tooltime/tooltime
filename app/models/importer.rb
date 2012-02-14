class Importer  
  def initialize(hits_file, jobs_file, seqs_file)
    @cp = Parsers::ComparisonParser.new(jobs_file)
    @ep = Parsers::ExperimentParser.new(jobs_file)
    @gp = Parsers::GeneParser.new(jobs_file)
  end
  
  def import!
    comparison = @cp.import
    experiment = @ep.import
    experiment.genes << @gp.import
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
