require 'move'
require 'point'
require 'room'
require 'battery'
require 'trip'

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
    @current_point = Move.new(direction, current_point, battery).new_location
    location
  end

  def plan_trip(future_location)
    trip = Trip.new(@current_point, future_location)

  end
end
