require 'move'
require 'point'
require 'robot'
require 'room'

class Battery

  def initialize(sensor_reading)
    @battery_level = calculate_battery_level(sensor_reading)
  end

  def percentage
     "#{@battery_level.to_int}%"
  end

  def reduce_battery_level
    @battery_level -= 1
  end

    private
      def calculate_battery_level(sensor_reading)
        sensor_reading * 100
      end
end
