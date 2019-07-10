class Battery
  attr_reader :battery_level, :sensor_reading

  def initialize(sensor_reading = rand(0.1..1.0))
    @sensor_reading = sensor_reading
    @battery_level ||= calculate_starting_battery_level
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

  def calculate_starting_battery_level
    sensor_reading * 100
  end
end
