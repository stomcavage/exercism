class String
  def to_h
    {
      '0' => 0,  '1' => 1,  '2' => 2,  '3' => 3,
      '4' => 4,  '5' => 5,  '6' => 6,  '7' => 7,
      '8' => 8,  '9' => 9,  'a' => 10, 'b' => 11,
      'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
    }[self]
  end
end

class Hexadecimal
  def initialize(hex_num)
    @hex_num = hex_num.to_s.downcase
    @hex_num = '0' unless @hex_num =~ /^[0-9a-f]+$/
  end

  def to_decimal
    @hex_num.reverse.chars.map.with_index { |num, i| num.to_h * 16**i }.inject(:+)
  end
end
