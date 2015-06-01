class Nucleotide
  attr_reader :histogram

  def self.from_dna(dna)
    Nucleotide.new(dna)
  end

  def initialize(dna)
    @histogram = {
      "A" => 0,
      "T" => 0,
      "C" => 0,
      "G" => 0
    }
    dna.each_char do |c|
      raise ArgumentError unless @histogram.key?(c)
      @histogram[c] += 1
    end
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end
end
