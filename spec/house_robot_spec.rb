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
    expect(fredrick.move("south")).to eql("I'm in the Living Room at co-ordinate 1, 0.")
    expect(fredrick.move("west")).to eql("I'm in the Living Room at co-ordinate 0, 0.")
  end
end

# Unit Tests

RSpec.describe Move do
  describe '.new' do
    it "takes the direction you want to move as a string" do
      expect(Move.new("south", double)).to be
    end

    it "takes the robots current location as a point" do
      living_room = Room.new("living_room")
      point = Point.new(living_room, 1, 1)
      expect(Move.new("south", point).location).to eql(Point.new(living_room, 1, 2))
    end
  end

  describe '#update_current_location' do
    it "updates current location" do
      living_room = Room.new("living_room")
      point = Point.new(living_room, 1, 1)
      expect(Move.new("north", point).update_current_location).to be
    end
  end
    context "receives invalid input" do
      it "raises an error" do
        point = double
        expect{ Move.new("diagonally", point) }.to raise_error(Move::InvalidDirectionError)
      end
    end
  end


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

  describe '#update_location' do
    it "when given the string north, it increases the y coordinate by one" do
      point = Point.new(double, 5, 7)
      point.update_location("north")

      expect(point.y_coord).to eql(8)
    end

    it "when given the string south, it decreases the y coordinate by one" do
      point = Point.new(double, 5, 7)
      point.update_location("south")

      expect(point.y_coord).to eql(6)
    end

    it "when given the string east, it increases the x coordinate by one" do
      point = Point.new(double, 5, 7)
      point.update_location("east")

      expect(point.x_coord).to eql(6)
    end

    it "when given the string west, it decreases the x coordinate by one" do
      point = Point.new(double, 5, 7)
      point.update_location("west")

      expect(point.x_coord).to eql(4)
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
