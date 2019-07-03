require 'trip'

RSpec.describe Trip do
  describe ".new" do
    it 'takes a current location and a future location' do
      current_location = Point.new(double, 0, 0)
      future_location = Point.new(double, 5, 3)
      expect(Trip.new(current_location, future_location)).to be
    end
  end
end
