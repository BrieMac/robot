class Robot

  attr_reader :battery, :current_point

  def initialize(name, point, battery)
    @name = name
    @current_point = point
    @battery = battery

  end

  def location
    "I'm in the #{@current_point.to_s}."
  end

  def battery_level
    "My battery is at #{@battery.percentage}"
  end

  def move(direction)
    updated_location = Move.new(direction, current_point)
    updated_location.new_location
    location
  end
end


class Room

  attr_reader :name

  def initialize(name)
    @name = name
  end
end


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

  def update_location(axis, increment)
      if axis == 'x'
        @x_coord += increment
      elsif axis == 'y'
        @y_coord += increment
      else
        raise AxisMustBeXOrYError
      end
  end
end


class Battery

  def initialize(sensor_reading)
    @battery_level = battery_level(sensor_reading)
  end

  def percentage
     "#{@battery_level.to_int}%"
  end

    private
      def battery_level(sensor_reading)
        sensor_reading * 100
      end
end


class Move

  class InvalidDirectionError < StandardError
  end

  class LocationHasAlreadyBeenUpdated < StandardError
  end

    attr_reader :point, :direction
    attr_accessor :location_has_been_updated

  def initialize(direction, point)
    unless %w[north south east west].include? direction.downcase
      raise InvalidDirectionError
    end
    @direction = direction
    @point = point
    @location_has_been_updated = false
  end

  def new_location
    unless location_has_been_updated == false
       raise LocationHasAlreadyBeenUpdated
    end
    update_to_new_location
  end

    private

      def update_to_new_location
        @location_has_been_updated = true
        case direction.downcase
        when "north"
          point.update_location('y', 1)
        when "south"
          point.update_location('y', -1)
        when "east"
          point.update_location('x', 1)
        when "west"
          point.update_location('x', -1)
        end
        Point.new(point.room, point.x_coord, point.y_coord)
      end
end
