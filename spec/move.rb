require 'house_robot'

RSpec.describe Move do
  let(:point) {Point.new(double, 1, 1)}

  describe '.new' do
    it "takes the direction you want to move as a string" do
      expect(Move.new("south", double)).to be
    end
  end

  describe '#new_location' do
    context "receives valid input"
      it "returns the new location" do
        living_room = Room.new("living_room")
         point = Point.new(living_room, 1, 1)
        expect(Move.new("north", point).new_location).to eq(Point.new(living_room, 1,2))
      end
    end

    context "receives invalid input" do
      it "raises an error" do
        point = double
        expect{ Move.new("diagonally", point) }.to raise_error(Move::InvalidDirectionError)
      end
    end

    it "when given the string north, it increases the y coordinate by one" do
      move = Move.new("north", point)
      move.new_location

      expect(point.y_coord).to eql(2)
    end

    it "when given the string south, it decreases the y coordinate by one" do
      move = Move.new("south", point)
      move.new_location

      expect(point.y_coord).to eql(0)
    end

    it "when given the string east, it increases the x coordinate by one" do
      move = Move.new("east", point)
      move.new_location

      expect(point.x_coord).to eql(2)
    end

    it "when given the string west, it decreases the x coordinate by one" do
      move = Move.new("west", point)
      move.new_location

      expect(point.x_coord).to eql(0)
    end
  end
