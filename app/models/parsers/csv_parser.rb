require 'csv'

module Parsers
  class CSVParser
    def initialize(data)
      @data = CSV.parse(data)
    end
    
    def get_val(key)
      val = nil
      if key.is_a? Symbol
        val = @data[map(key)].last
      elsif key.is_a? Integer
        val = @data[key].last
      end
      val.strip if val.is_a? String
    end
  end
end
