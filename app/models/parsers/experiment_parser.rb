module Parsers
  class ExperimentParser < CSVParser
    def map(key)
      map = {
        :label => 1,
        :tess  => 0
      }
      map[key]
    end
    
    def import
      Experiment.create(:label => get_val(:label), :tess => get_val(:tess))
    end
  end
end
