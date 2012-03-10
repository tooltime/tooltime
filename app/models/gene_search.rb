require 'set'

class GeneSearch
  def initialize(tfactors, constraints)
    @tfactors = tfactors.map {|f| TranscriptionFactor.where(name: f).first}
    @constraints = constraints
    @reg_elements = {}
    @genes = {}
  end
  
  def run
    get_regulatory_elements
    get_genes
  end
  
  def results
    results = @genes[@tfactors.first.name]
    @genes.each do |name, genes|
       results = results & genes
    end
    results.to_a
  end
  
  def self.test
    search = GeneSearch.new(['AF-1', 'BSAP'], {:la => 0})
    search.run
    search.results
  end
  
  private
  
  def get_regulatory_elements
    @tfactors.each do |f|
      all_elements = f.regulatory_elements
      if empty_constraints?
        @reg_elements[f.name] = all_elements
      else
        if !@constraints[:la].empty?
          all_elements = all_elements.where('la > :la', {:la => @constraints[:la]})
        end
        if !@constraints[:la_slash].empty?
          all_elements = all_elements.where('la_slash > :la_slash', {:la_slash => @constraints[:la_slash]})
        end
        if !@constraints[:lq].empty?
          all_elements = all_elements.where('lq > :lq', {:lq => @constraints[:lq]})
        end
        if !@constraints[:ld].empty?
          all_elements = all_elements.where('ld < :ld', {:ld => @constraints[:ld]})
        end
        @reg_elements[f.name] = all_elements
      end
    end
  end
  
  def empty_constraints?
    @constraints.all? {|k,v| v.empty?}
  end
  
  def get_genes
    @reg_elements.each do |name, elements|
      @genes[name] = @reg_elements[name].map(&:gene).to_set
    end
  end
end
