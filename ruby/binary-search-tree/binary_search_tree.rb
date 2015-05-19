class Bst

  attr_reader :left, :right, :data

  include Enumerable

  def initialize(data)
    @left  = nil
    @right = nil
    @data  = data
  end

  def insert(data)
    if data <= @data
      @left ? @left.insert(data) : @left = Bst.new(data)
    else
      @right ? @right.insert(data) : @right = Bst.new(data)
    end
  end

  def each
    @left.each {|node| yield node} unless @left.nil?
    yield @data
    @right.each {|node| yield node} unless @right.nil?
  end
end
