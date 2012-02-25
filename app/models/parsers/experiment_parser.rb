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
      e = Experiment.new(:label => get_val(:label), :tess => get_val(:tess))
      if e.save
        e
      else
        Experiment.where(:label => get_val(:label), :tess => get_val(:tess)).first
      end
    end
  end
end
