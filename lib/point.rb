class Point
  class AxisMustBeXOrYError < StandardError
  end

  attr_accessor :y_coordinate, :x_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def coordinates
    { x: x_coordinate, y: y_coordinate }
  end

  def to_s
    "co-ordinate #{x_coordinate}, #{y_coordinate}"
  end

  def ==(other)
    coordinates == other.coordinates
  end
end
