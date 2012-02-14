module Parsers
  class PromoterParser < CSVParser
    def map(key)
      map = {
        :sequence => 1        
      }
      map[key]
    end
    
    def import
      c = Promoter.create(:sequence => get_val(:sequence))
    end
  end
end
