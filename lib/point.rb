class Point
  class AxisMustBeXOrYError < StandardError
  end

  attr_accessor :y_coordinate, :x_coordinate
  attr_reader :room

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def ==(other)
    coordinates == other.coordinates
  end

  def coordinates
    {x: @x_coordinate, y: @y_coordinate}
  end

  def to_s
    "co-ordinate #{@x_coordinate}, #{@y_coordinate}"
  end

  def update_coordinates(axis, increment)
      if axis == 'x'
        @x_coordinate += increment
      elsif axis == 'y'
        @y_coordinate += increment
      else
        raise AxisMustBeXOrYError
      end
  end
end
