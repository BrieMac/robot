require 'move'

RSpec.describe Move do
  let(:point) {Point.new(double(name: "Living Room"), 1, 1)}
  let (:battery) {Battery.new(0.5)}

  describe '.new' do
    it "takes the direction you want to move as a string" do
      expect(Move.new("south", double, battery)).to be
    end
  end

  describe '#new_location' do
    context "receives valid input"
      it "returns the new location" do
        living_room = Room.new("living_room")
         point = Point.new(living_room, 1, 1)
        expect(Move.new("north", point, battery).new_location).to eq(Point.new(living_room, 1,2))
      end
    end

    context "receives invalid input" do
      it "raises an error" do
        point = double
        expect{ Move.new("diagonally", point, battery) }.to raise_error(Move::InvalidDirectionError)
      end
    end

    it "when given the string north, it increases the y coordinate by one" do
      move = Move.new("north", point, battery)
      move.new_location

      expect(point.y_coord).to eql(2)
    end

    it "when given the string south, it decreases the y coordinate by one" do
      move = Move.new("south", point, battery)
      move.new_location

      expect(point.y_coord).to eql(0)
    end

    it "when given the string east, it increases the x coordinate by one" do
      move = Move.new("east", point, battery)
      move.new_location

      expect(point.x_coord).to eql(2)
    end

    it "when given the string west, it decreases the x coordinate by one" do
      move = Move.new("west", point, battery)
      move.new_location

      expect(point.x_coord).to eql(0)
    end

    it "updates @location_has_been_updated when location is updated" do
      move = Move.new("north", point, battery)
      move.new_location
      expect(move.location_has_been_updated).to be(true)
    end

    it "returns the same location if called multiple times" do
      new_point = Point.new(double(name: "Living Room"), 1, 2)
      move = Move.new("north", point, battery)
      move.new_location
      expect(move.new_location).to eq(new_point)
    end
  end
