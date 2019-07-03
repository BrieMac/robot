require 'point'
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
          expect{ point.update_coordinates('v', 1) }.to raise_error(Point::AxisMustBeXOrYError)
        end
      end
    end
  end
end
