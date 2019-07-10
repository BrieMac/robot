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
    "My battery is at #{battery.to_percentage}"
  end

  def move(direction)
    # trip = Trip.new(current_location, future_location, battery)
    # Need to split this next line because we need to create the trip before we update the current point value.
    move = Move.new(direction, current_point).new_location
    # trip = Trip.new(current_location, future_location, battery.battery_level)
    @current_point = move
    # Ask the trip what impact this is going to have on the battery
    location
  end

  def plan_trip(future_location)
    Trip.new(@current_point, future_location, battery).forecast
  end
end
