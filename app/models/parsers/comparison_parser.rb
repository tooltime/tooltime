module Parsers
  class ComparisonParser < CSVParser
    def map(key)
      map = {
        :state   => 2,
        :species => 3
      }
      map[key]
    end
    
    def import
      c = Comparison.new(:state => get_val(:state), :species => get_val(:species))
      if c.save
        c
      else
        Comparison.where(:state => get_val(:state), :species => get_val(:species)).first
      end
    end
  end
end
