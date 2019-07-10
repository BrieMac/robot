require 'point'
require 'robot'
require 'battery'

#Behavioural tests

RSpec.describe 'our robot application' do

  it 'allows us to ask where the robot is' do
    point = Point.new(3, 8)
    fredrick = Robot.new("Fredrick", point, double)
    expect(fredrick.location).to eq("I'm at co-ordinate 3, 8.")
  end

  it "allows us to ask the robot's battery level" do
    point = Point.new(3, 8)
    battery = Battery.new(0.5)
    fredrick = Robot.new("Fredrick", point, battery)
    expect(fredrick.battery_level).to eq("My battery is at 50%")
  end

  it "can move north, south, east and west" do
    point = Point.new(0, 0)
    battery = Battery.new(0.5)
    fredrick = Robot.new("Fredrick", point, battery)
    expect(fredrick.move("north")).to eq("I'm at co-ordinate 0, 1.")
    expect(fredrick.move("east")).to eq("I'm at co-ordinate 1, 1.")
    expect(fredrick.move("south",)).to eq("I'm at co-ordinate 1, 0.")
    expect(fredrick.move("west")).to eq("I'm at co-ordinate 0, 0.")
  end

  context 'the robot has enough battery to make the trip' do
    it "tells us our forecast battery level for a future destination" do
      battery = Battery.new(1.0)
      current_location = Point.new(0, 0)
      future_location = Point.new(3, 5)
      fredrick = Robot.new("Fredrick", current_location, battery)
      expect(fredrick.plan_trip(future_location)).to eq("When I arrive at co-ordinate 3, 5 I will have 92% battery remaining")
    end

    context 'the robot does not have enough battery to make the trip' do
      it 'tels us that it cannot make the trip' do
        battery = Battery.new(0.05)
        current_location = Point.new(0, 0)
        future_location = Point.new(3, 5)
        fredrick = Robot.new("Fredrick", current_location, battery)

        expect(fredrick.plan_trip(future_location)).to eq("I don't have sufficient battery to travel to co-ordinate 3, 5")
      end
    end
  end
  it 'tells us if we have the estimated battery life to make a trip' do

  end
end
