require 'house_robot'

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
    fredrick = Robot.new("Fredrick", point, double)
    expect(fredrick.move("north")).to eql("I'm in the Living Room at co-ordinate 0, 1.")
    expect(fredrick.move("east")).to eql("I'm in the Living Room at co-ordinate 1, 1.")
    expect(fredrick.move("south",)).to eql("I'm in the Living Room at co-ordinate 1, 0.")
    expect(fredrick.move("west")).to eql("I'm in the Living Room at co-ordinate 0, 0.")
  end
end

# Unit Tests

RSpec.describe Battery do
  describe ".new" do
    it "takes a sensor reading" do
      expect(Battery.new(0)).to be
    end
  end

  describe "#battery_percentage" do
    it "returns the current percentage of the battery" do
      expect(Battery.new(0.7).percentage).to eql("70%")
    end
  end
end

RSpec.describe Room do
  describe ".new" do
    it "takes a name" do
      expect(Room.new("Bathroom")).to be
    end
  end

  describe "#name" do
    it "returns the name of the room" do
      expect(Room.new("Bedroom").name).to eql("Bedroom")
    end
  end
end

RSpec.describe Point do
  describe ".new" do
    it "takes a Room, an x co-ordinate and a y co-ordinate" do
      expect(Point.new(double, 5, 5)).to be
    end
  end

  describe "#coordinates" do
    it "returns a hash with x and y values" do
      expect(Point.new(double, 5, 7).coordinates).to eql(x: 5, y: 7)
    end
  end

  describe "#room_name" do
    it "returns the name of the room" do
      expect(Point.new(double(name: "Bathroom"), 5, 7).room_name).to eql("Bathroom")
    end
  end

  describe "#to_s" do
    it "returns a string with the robot's current location" do
      expect(Point.new(double(name: "Bathroom"), 5, 7).to_s).to eql("Bathroom at co-ordinate 5, 7")
    end
  end

  describe '#==' do
    let(:living_room) { double(name: "living room") }
    let(:bathroom) { double(name: "bathroom") }

    context 'when the location is different' do
      it 'returns false' do
        expect(Point.new(living_room, 2, 2)).to_not eq(Point.new(bathroom, 2,2))
      end
    end
    context 'when the y coordinate is different' do
      it 'returns false' do
        expect(Point.new(bathroom, 2, 1)).to_not eq(Point.new(bathroom, 2,2))
      end
    end
    context 'when the x coordinate is different' do
      it 'returns false' do
        expect(Point.new(bathroom, 1, 2)).to_not eq(Point.new(bathroom, 2,2))
      end
    end
    context 'when everything is the same' do
      it 'returns true' do
        expect(Point.new(bathroom, 2, 2)).to eq(Point.new(bathroom, 2,2))
      end
    end

    describe '#update_location' do
      context 'when axis value is invalid' do
        it 'raises an error' do
          point = Point.new(double, 1, 1)
          expect{ point.update_location('v', 1) }.to raise_error(Point::AxisMustBeXOrYError)
        end
      end
    end
  end
end

RSpec.describe Robot do
  describe ".new" do
    it "takes a name and starting point and battery" do
      expect(Robot.new("Fredrick", double, double)).to be
    end
  end
end
