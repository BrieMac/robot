require 'move'

RSpec.describe Move do
  let(:point) { Point.new(1, 1) }

  describe '.new' do
    context 'receives an invalid direction' do
      it 'raises an error' do
        expect { Move.new('diagonally', double) }.to raise_error(Move::InvalidDirectionError)
      end
    end
  end

  describe '#new_location' do
    it 'returns the new location' do
      expect(Move.new('north', point).new_location).to eq(Point.new(1, 2))
    end

    it 'when given the string north, it increases the y coordinate by one' do
      move = Move.new('north', point)
      expect(move.new_location.y_coordinate).to eq(2)
    end

    it 'when given the string south, it decreases the y coordinate by one' do
      move = Move.new('south', point)
      expect(move.new_location.y_coordinate).to eq(0)
    end

    it 'when given the string east, it increases the x coordinate by one' do
      move = Move.new('east', point)
      expect(move.new_location.x_coordinate).to eq(2)
    end

    it 'when given the string west, it decreases the x coordinate by one' do
      move = Move.new('west', point)
      expect(move.new_location.x_coordinate).to eq(0)
    end

    it 'returns the same location if called multiple times' do
      updated_point = Point.new( 1, 2)
      move = Move.new('north', point)
      move.new_location
      move.new_location
      expect(move.new_location).to eq(updated_point)
    end
  end
end
