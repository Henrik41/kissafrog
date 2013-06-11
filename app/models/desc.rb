class Desc < ActiveRecord::Base
  attr_accessible :bodytype, :drink, :drug, :education, :ethnicity, :eye, :hair, :height, :kids, :language, :longestrelation, :marital, :pets, :profession, :religion, :smoke, :wantkids
  
  def height_options
      heights = Hash.new

      for n in 48..84
        feet = (n/12).floor
        inches = n % 12
        heights[n] = "#{feet}'#{inches}''"
      end

      return heights.to_a.sort.map { |h| h.reverse }
  end
end
