require 'move'
require 'point'
require 'robot'
require 'room'
require 'battery'
class Room

  attr_reader :name

  def initialize(name)
    @name = name
  end
end
