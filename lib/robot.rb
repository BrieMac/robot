require 'move'
require 'point'
require 'room'
require 'battery'

class Robot

  attr_reader :battery, :current_point

  def initialize(name, point, battery)
    @name = name
    @current_point = point
    @battery = battery
  end

  def location
    "I'm in the #{current_point.to_s}."
  end

  def battery_level
    "My battery is at #{battery.percentage}"
  end

  def move(direction)
    updated_location = Move.new(direction, current_point, battery)
    updated_location.new_location
    location
  end
end
