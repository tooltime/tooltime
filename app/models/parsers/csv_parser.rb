require 'csv'

module Parsers
  class CSVParser
    def initialize(filename)
      @data = CSV.read(filename)
    end
    
    def get_val(key)
      @data[map(key)].last
    end
  end
end
