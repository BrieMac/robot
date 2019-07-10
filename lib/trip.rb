require 'move'
require 'point'
require 'robot'
require 'battery'

class Trip

  attr_reader :current_location, :future_location

  def initialize(current_location, future_location, battery)
    @current_location = current_location
    @future_location = future_location
    @current_battery_level = battery.battery_level
  end

  def forecast
    if forecast_battery_level > 0
      "When I arrive at the #{future_location.to_s} I will have #{forecast_battery_level.to_i}% battery remaining"
    else
      "I don't have sufficient battery to travel to the #{future_location.to_s}"
    end
  end

  def trip_length
    (future_location.x_coord + future_location.y_coord) - (current_location.x_coord + current_location.y_coord)
  end

  def forecast_battery_level
    battery = Battery.new(@current_battery_level / 100)
    trip_length.times { battery.forecast_drain }
    battery.battery_level
  end

  def actual_battery_level
    battery = Battery.new(@current_battery_level / 100)
    trip_length.times { battery.actual_drain }
    battery.battery_level
  end
end
