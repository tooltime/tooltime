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
      reg_elements = []
      @data.each do |row|
        next if row === @data[0]
        r = RegulatoryElement.create(
          :beg      => row[map(:beg)],
          :len      => row[map(:len)],
          :sns      => row[map(:sns)],
          :sequence => row[map(:sequence)],
          :la       => row[map(:la)],
          :la_slash => row[map(:la_slash)],
          :lq       => row[map(:lq)],
          :ld       => row[map(:ld)],
          :ppv      => row[map(:ppv)]
        )
        
        factor_info = row[0].split ' '
        
        # parse factor field
        if factor_info.first == '_00000'
          add_factor(r, factor_info.last)
        else
          factor_info.each do |val|
            if is_tnum? val
              add_page(r, val)
            else
              add_factor(r, val)
            end
          end
        end
        
        # parse model field
        mval = row[1]
        if mval.start_with?('I') || mval.start_with?('M')
          r.model = mval.split(' ').first
        elsif mval.start_with?('R')
          r.model = mval.split('()').map(&:strip).join('/')
        end
        
        r.save!
        reg_elements << r
      end
      
      reg_elements
    end
      
    private
    
    def is_tnum?(str)
      !(str =~ /^T\d{5}$/).nil?
    end
    
    def add_factor(reg, factor_name)
      factor = TranscriptionFactor.new(:name => factor_name)
      unless factor.save
        factor = TranscriptionFactor.where(:name => factor_name).first
      end
      reg.transcription_factors << factor
    end
    
    def add_page(reg, page_name)
      page = Page.new(:name => page_name)
      unless page.save
        page = Page.where(:name => page_name).first
      end
      reg.pages << page
    end
    
    def self.test
      reparser = self.new(File.join(Rails.root, 'tmp', 'ExperimentData', 'bACO2 promoter TESS Hits 1.csv'))
      reparser.import
    end
  end
end
