class Trip
  attr_reader :current_location, :future_location, :current_battery_level

  def initialize(current_location, future_location, battery)
    @current_location = current_location
    @future_location = future_location
    @current_battery_level = battery.battery_level
  end

  def forecast
    if forecast_battery_level > 0
      "When I arrive at #{future_location} I will have #{forecast_battery_level.to_i}% battery remaining"
    else
      "I don't have sufficient battery to travel to #{future_location}"
    end
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

  private

  def trip_length
    (future_location.x_coordinate + future_location.y_coordinate) - (current_location.x_coordinate + current_location.y_coordinate)
  end
end
