class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = nil
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    @paint != nil
  end
end
