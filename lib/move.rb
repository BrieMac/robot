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
      Point.new(point.room, point.x_coord, point.y_coord + 1)
    when 'south'
      Point.new(point.room, point.x_coord, point.y_coord - 1)
    when 'east'
      Point.new(point.room, point.x_coord + 1, point.y_coord)
    when 'west'
      Point.new(point.room, point.x_coord - 1, point.y_coord)
    end
  end
end
