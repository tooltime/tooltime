require 'set'

class FactorPopularity
  def initialize(experiments, constraints)
    @experiments = experiments.map {|e| Experiment.where(label: e).first}
    @genes = {}
    @factors = {}
  end
  
  def run
    @experiments.each do |e|
      e.genes.each do |g|
        g.regulatory_elements.each do |r|
          r.transcription_factors.each {|t| process(t, g)}
        end
      end
    end
  end
  
  def results
    factors = {}
    @factors.each do |name,total|
      factors[name] = {
        total: total,
        genes: @genes[name]
      }
    end
    factors
  end
  
  def self.test
    test = self.new([Experiment.first.label], {})
    test.run
    test.results
  end
  
  private
  
  def process(factor, gene)
    # update total occurrences
    if @factors[factor.name].nil?
      @factors[factor.name] = 1
    else
      @factors[factor.name] += 1
    end
    
    # update gene occurences
    if @genes[factor.name].nil?
      @genes[factor.name] = Set.new [gene]
    else
      @genes[factor.name] << gene
    end
  end
end
