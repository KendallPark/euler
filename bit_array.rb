# not actually faster for large length

class BitArray

  attr_reader :length

  def initialize(length, default=nil)
    @length = length
    if default
      @array = (1<<length) - 1
    else
      @array = 0
    end
  end

  def [](index)
    ((@array >> index) & 1) == 1
  end

  def []=(index, value)
    if value
      @array |= (1 << index)
    else
      @array &= (((1<<length) - 1) - (1<<index))
    end
  end

  def to_s
    binary = @array.to_s(2).reverse
    binary + "0"*(length - binary.length)
  end
end
