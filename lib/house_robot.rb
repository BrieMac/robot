class Robot

  attr_reader :battery

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
    @current_point.update_location(direction)
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

  def update_location(direction)
    case direction.downcase
      when "north"
        @y_coord += 1
      when "south"
        @y_coord -= 1
      when "east"
        @x_coord += 1
      when "west"
        @x_coord -= 1
      else
        # TODO: Raise expection here
      puts "Raise exception here"
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

    attr_reader :point, :direction

  def initialize(direction, point)
    unless %w[north south east west].include? direction.downcase
      raise InvalidDirectionError
    end
    @direction = direction
    @point = point
  end


    def new_location
      case direction.downcase
      when "north"
        point.y_coord += 1
      when "south"
        point.y_coord -= 1
      when "east"
        point.x_coord += 1
      when "west"
        point.x_coord -= 1
      end
      Point.new(point.room, point.x_coord, point.y_coord)
    end

end
