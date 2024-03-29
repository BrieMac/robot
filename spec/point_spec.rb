require 'point'

RSpec.describe Point do

  describe '#coordinates' do
    it 'returns a hash with x and y values' do
      expect(Point.new(5, 7).coordinates).to eq(x: 5, y: 7)
    end
  end

  describe '#to_s' do
    it "returns a string with the robot's current location" do
      expect(Point.new(5, 7).to_s).to eq('co-ordinate 5, 7')
    end
  end

  describe '#==' do
    context 'when the y coordinate is different' do
      it 'returns false' do
        expect(Point.new(2, 1)).to_not eq(Point.new(2, 2))
      end
    end
    context 'when the x coordinate is different' do
      it 'returns false' do
        expect(Point.new(1, 2)).to_not eq(Point.new(2, 2))
      end
    end
    context 'when all attributes are the same' do
      it 'returns true' do
        expect(Point.new(2, 2)).to eq(Point.new(2, 2))
      end
    end
  end
end
