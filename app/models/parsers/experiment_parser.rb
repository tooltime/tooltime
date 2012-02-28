module Parsers
  class ExperimentParser < CSVParser
    def map(key)
      map = {
        :label => 1,
        :tess  => 0
      }
      map[key]
    end
    
    # ignoring TESS for now...should fix later
    def import
      e = Experiment.new(:label => get_val(:label))
      if e.save
        e
      else
        Experiment.where(:label => get_val(:label)).first
      end
    end
  end
end
