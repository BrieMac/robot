class Robot
  attr_reader :battery, :current_point, :name

  def initialize(name, point = Point.new(0, 0), battery = Battery.new)
    @name = name
    @current_point = point
    @battery = battery
  end

  def introduce
    "I'm #{name}"
  end

  def location
    "I'm at #{current_point}."
  end

  def battery_level
    "My battery is at #{battery.to_percentage}"
  end

  def move(direction)
    @current_point = Move.new(direction, current_point).new_location
    location
  end

  def plan_trip(future_location)
    Trip.new(current_point, future_location, battery).forecast
  end
end
