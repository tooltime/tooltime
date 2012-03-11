require 'set'

class FactorPopularity
  def initialize(experiments, constraints)
    @experiments = experiments.map {|e| Experiment.where(label: e).first}
    @genes = {}
    @factors = {}
    @constraints = constraints
  end
  
  def run
    @experiments.each do |e|
      e.genes.each do |g|
        constrained_elements(g.regulatory_elements).each do |r|
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
  
  def perform
    self.run
  end
  
  def self.test
    test = self.new([Experiment.first.label], {:la => '50', :la_slash => '', :lq => '', :ld => ''})
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
  
  def constrained_elements(elements)
    if empty_constraints?
      elements
    else
      if !@constraints[:la].empty?
        elements = elements.where('la > :la', {:la => @constraints[:la]})
      end
      if !@constraints[:la_slash].empty?
        elements = elements.where('la_slash > :la_slash', {:la_slash => @constraints[:la_slash]})
      end
      if !@constraints[:lq].empty?
        elements = elements.where('lq > :lq', {:lq => @constraints[:lq]})
      end
      if !@constraints[:ld].empty?
        elements = elements.where('ld < :ld', {:ld => @constraints[:ld]})
      end
      elements
    end
  end
  
  def empty_constraints?
    @constraints.all? {|k,v| v.empty?}
  end
end
