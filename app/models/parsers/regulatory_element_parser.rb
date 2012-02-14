module Parsers

  class RegulatoryElementParser < CSVParser

    def map(key)
      map = {
        :beg      => 2,
        :len      => 4,
        :sns      => 3,
        :model    => 1,
        :sequence => 5,
        :la       => 6,
        :la_slash => 7,
        :lq       => 8,
        :ld       => 9,
        :ppv      => 14
      }
      map[key]
    end

    def import
      created_elements = Array.new

      @data.each do |row|
        next if row === @data[0]
        created_elements << RegulatoryElement.create(
                                 :beg      => row[map(:beg)],
                                 :len      => row[map(:len)],
                                 :sns      => row[map(:sns)],
                                 :model    => row[map(:model)],
                                 :sequence => row[map(:sequence)],
                                 :la       => row[map(:la)],
                                 :la_slash => row[map(:la_slash)],
                                 :lq       => row[map(:lq)],
                                 :ld       => row[map(:ld)],
                                 :ppv      => row[map(:ppv)]
                           )
      end
          
      created_elements
    end
  end       
end      