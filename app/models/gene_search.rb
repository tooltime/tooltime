require 'set'

class GeneSearch
  def initialize(tfactors)
    @tfactors = tfactors.map {|f| TranscriptionFactor.where(name: f).first}
    @reg_elements = {}
    @genes = {}
  end
  
  def run
    get_regulatory_elements
    get_genes
    #Rails.logger.debug "[DEBUGGING] #{@genes.size} genes found"
  end
  
  def results
    results = @genes[@tfactors.first.name]
    @genes.each do |name, genes|
       results = results & genes
    end
    results.to_a
  end
  
  def self.test
    search = GeneSearch.new(['AF-1', 'BSAP'])
    search.run
    search.results
  end
  
  private
  
  def get_regulatory_elements
    @tfactors.each {|f| @reg_elements[f.name] = f.regulatory_elements}
  end
  
  def get_genes
    @reg_elements.each do |name, elements|
      @genes[name] = @reg_elements[name].map(&:gene).to_set
    end
  end
end
