class Crypto

  include Math

  def initialize(plaintext)
    @plaintext = plaintext.gsub(/\W/, '').downcase
    @cols = sqrt(@plaintext.length).ceil
    @rows = (@plaintext.length / @cols.to_f).ceil
  end

  def normalize_plaintext
    @plaintext
  end

  def size
    @cols
  end

  def plaintext_segments
    output = []
    @rows.times do |i|
      output.push(@plaintext.slice(@cols * i, @cols))
    end
    output
  end

  def ciphertext
    encode_square.join('')
  end

  def normalize_ciphertext
    encode_square.join(' ')
  end

  private

  def encode_square
    input = plaintext_segments
    output = []
    @cols.times do |i|
      word = input.map {|characters| characters[i]}
      output.push(word.join(''))
    end
    output
  end
end

