module Parsers
  class PromoterParser < CSVParser
    def map(key)
      map = {
        :sequence => 1        
      }
      map[key]
    end
    
    def import
      p = Promoter.new(:sequence => get_val(:sequence))
      p.save ? p : Promoter.where(:sequence => p.sequence).first
    end
  end
end
