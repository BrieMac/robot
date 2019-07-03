require 'move'
require 'point'
require 'robot'
require 'room'
require 'battery'

class Point

  class AxisMustBeXOrYError < StandardError
  end


  attr_accessor :y_coord, :x_coord
  attr_reader :room

  def initialize(room, x_coord, y_coord)
    @room = room
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def ==(other)
    coordinates == other.coordinates  && room_name == other.room_name
  end

  def coordinates
    {x: @x_coord, y: @y_coord}
  end

  def room_name
    @room.name
  end

  def to_s
    "#{room_name} at co-ordinate #{@x_coord}, #{@y_coord}"
  end

  def update_coordinates(axis, increment)
      if axis == 'x'
        @x_coord += increment
      elsif axis == 'y'
        @y_coord += increment
      else
        raise AxisMustBeXOrYError
      end
  end
end
