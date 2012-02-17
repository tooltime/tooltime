module Parsers
  class GeneParser < CSVParser
    Map = {
      :abbrev                => 5,
      :name                  => 4,
      :species               => 3,
      :chromosome            => 6,
      :beg_site              => 7,
      :end_site              => 8,
      :regulation            => 9,
      :length                => 10,
      :email                 => 11,
      :transfac_strs         => 12,
      :mysite_strs           => 13,
      :selected_one          => 14,
      :transfac_matrices     => 15,
      :imd_matrices          => 16,
      :cbil_matrices         => 17,
      :jaspar_matrices       => 18,
      :myweight_matrices     => 19,
      :selected_two          => 20,
      :combine               => 21,
      :factor_attribute_one  => 22,
      :matches               => 23,
      :core_positions        => 24,
      :tmm                   => 25,
      :ts_a                  => 26,
      :tw                    => 27,
      :ta                    => 28,
      :group_selection_one   => 29,
      :td                    => 30,
      :tc                    => 31,
      :tm                    => 32,
      :lg_likelihood_deficit => 33,
      :sig_threshold         => 34,
      :selected_three        => 35,
      :pseudo_counts         => 36,
      :group_selection_two   => 37,
      :a_tcontent            => 38,
      :ambiguous             => 40
    }
    
    def map(key)
      Map[key]
    end
    
    def import
      attrs = Hash[Map] # fixed a major bug by creating a copy of the hash
      attrs.each {|k,v| attrs[k] = get_val(k)}
      # special parsing for distribution nums, which are all part of one field
      dists = get_val(39).split(',').map(&:to_f)
      attrs = attrs.merge({:a_distribution => dists[0], :c_distribution => dists[1], :g_distribution => dists[2], :t_distribution => dists[3]})
      
      g = Gene.new(attrs)
      if g.save
        g
      else
        Gene.where(:name => g.name, :species => g.species).first
      end
    end
  end
end
