class Move
  class InvalidDirectionError < StandardError
  end

  attr_reader :point, :direction

  def initialize(direction, point)
    unless %w[north south east west].include? direction.downcase
      raise InvalidDirectionError
    end

    @direction = direction
    @point = point
  end

  def new_location
    updated_location
  end

  private

  def updated_location
    case direction
    when 'north'
      Point.new(point.x_coordinate, point.y_coordinate + 1)
    when 'south'
      Point.new(point.x_coordinate, point.y_coordinate - 1)
    when 'east'
      Point.new(point.x_coordinate + 1, point.y_coordinate)
    when 'west'
      Point.new(point.x_coordinate - 1, point.y_coordinate)
    end
  end
end
