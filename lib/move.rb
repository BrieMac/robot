require 'point'
require 'robot'
require 'room'
require 'battery'

class Move

  class InvalidDirectionError < StandardError
  end

    attr_reader :point, :direction, :battery

  def initialize(direction, point, battery)
    unless %w[north south east west].include? direction.downcase
      raise InvalidDirectionError
    end
    @direction = direction
    @point = point
    @battery = battery
  end

  def new_location
    reduce_battery
    updated_location
  end

  private

  def reduce_battery
    @battery.reduce_battery_level
  end

  def updated_location
    case direction.downcase
    when "north"
      Point.new(point.room, point.x_coord, point.y_coord + 1)
    when "south"
      Point.new(point.room, point.x_coord, point.y_coord - 1)
    when "east"
      Point.new(point.room, point.x_coord + 1, point.y_coord)
    when "west"
      Point.new(point.room, point.x_coord - 1, point.y_coord)
    end
  end
end
