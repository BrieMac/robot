require 'point'
require 'robot'
require 'room'
require 'battery'
class Move

  class InvalidDirectionError < StandardError
  end

  class LocationHasAlreadyBeenUpdatedError < StandardError
  end

    attr_reader :point, :direction, :battery
    attr_accessor :location_has_been_updated

  def initialize(direction, point, battery)
    unless %w[north south east west].include? direction.downcase
      raise InvalidDirectionError
    end
    @direction = direction
    @point = point
    @battery = battery
    @location_has_been_updated = false
  end

  def new_location
    movement_controller
  end

    private

      def movement_controller
        # unless location_has_been_updated == false
        #    raise LocationHasAlreadyBeenUpdatedError
        # end
        reduce_battery

        if location_has_been_updated == false
          update_to_new_location
        else
          @point
        end
      end

      def reduce_battery
        @battery.reduce_battery_level
      end

      def update_to_new_location
        @location_has_been_updated = true
        case direction.downcase
        when "north"
          point.update_coordinates('y', 1)
        when "south"
          point.update_coordinates('y', -1)
        when "east"
          point.update_coordinates('x', 1)
        when "west"
          point.update_coordinates('x', -1)
        end
        @point = Point.new(point.room, point.x_coord, point.y_coord)
      end
end
