require 'point'
require 'robot'
require 'room'
require 'battery'

#Behavioural tests

RSpec.describe 'our robot application' do

  it 'allows us to ask where the robot is' do
    living_room = Room.new("Living Room")
    point = Point.new(living_room, 3, 8)
    fredrick = Robot.new("Fredrick", point, double)
    expect(fredrick.location).to eql("I'm in the Living Room at co-ordinate 3, 8.")
  end

  it "allows us to ask the robot's battery level" do
    living_room = Room.new("Living Room")
    point = Point.new(living_room, 3, 8)
    battery = Battery.new(0.5)
    fredrick = Robot.new("Fredrick", point, battery)
    expect(fredrick.battery_level).to eql("My battery is at 50%")
  end

  it "can move north, south, east and west" do
    living_room = Room.new("Living Room")
    point = Point.new(living_room, 0, 0)
    battery = Battery.new(0.5)
    fredrick = Robot.new("Fredrick", point, battery)
    expect(fredrick.move("north")).to eql("I'm in the Living Room at co-ordinate 0, 1.")
    expect(fredrick.move("east")).to eql("I'm in the Living Room at co-ordinate 1, 1.")
    expect(fredrick.move("south",)).to eql("I'm in the Living Room at co-ordinate 1, 0.")
    expect(fredrick.move("west")).to eql("I'm in the Living Room at co-ordinate 0, 0.")
  end

  it "reduces the battery level by 1% for each movement taken" do
  living_room = Room.new("Living Room")
  battery = Battery.new(1.0)
  point = Point.new(living_room, 0, 0)
  fredrick = Robot.new("Fredrick", point, battery)
  fredrick.move("west")
  expect(fredrick.battery_level).to eql("My battery is at 99%")
  end
end
