require 'move'
require 'point'
require 'robot'
require 'room'

class Battery

  attr_reader :battery_level

  def initialize(sensor_reading = rand(0.1..1.0))
    @starting_battery_level = calculate_starting_battery_level(sensor_reading)
    @battery_level ||= @starting_battery_level
  end

  def to_percentage
     "#{@battery_level.to_int}%"
  end

  def actual_drain
    @battery_level -= rand(0.5..2.0)
  end

  def forecast_drain
    @battery_level -= 1
  end

    private
      def calculate_starting_battery_level(sensor_reading)
        sensor_reading * 100
      end
end
