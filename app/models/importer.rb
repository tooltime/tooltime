class Importer  
  def initialize(hits_file, jobs_file, seqs_file)
    @cp = Parsers::ComparisonParser.new(jobs_file)
    @ep = Parsers::ExperimentParser.new(jobs_file)
  end
  
  def import!
    comparison = @cp.import
    comparison.experiments << @ep.import
  end
end
