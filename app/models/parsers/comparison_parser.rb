module Parsers
  class ComparisonParser < CSVParser
    def map(key)
      map = {
        :state   => 2,
        :species => 3
      }
      map[key]
    end
    
    def import!
      Comparison.create(:state => get_val(:state), :species => get_val(:species))
    end
  end
end
