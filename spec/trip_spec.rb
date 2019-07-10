require 'trip'

RSpec.describe Trip do
  describe ".new" do
    it 'takes a current location and a future location and a current battery level' do
      current_location = Point.new(0, 0)
      future_location = Point.new(5, 3)
      current_battery_level = Battery.new(0.5)

      expect(Trip.new(current_location, future_location, current_battery_level)).to be
    end
  end

  describe "#forecast_battery_level" do
    it "estimates battery usage based upon trip length" do
      current_location = Point.new(0, 0)
      future_location = Point.new(5, 3)
      current_battery_level = Battery.new(0.5)
      trip = Trip.new(current_location, future_location, current_battery_level)

      expect(trip.forecast_battery_level).to eq(42)
    end
  end

  describe "#actual_battery_level" do
    it "reports battery usage based upon trip length" do
      current_location = Point.new(0, 0)
      future_location = Point.new(5, 3)
      current_battery_level = Battery.new(0.5)
      trip = Trip.new(current_location, future_location, current_battery_level)

      expect(trip.actual_battery_level).to be_between(34, 46)
    end
  end

  describe "#trip_length" do
    it "calculates the number of points required to move from one location to another without using diagonals" do
    current_location = Point.new(0, 0)
    future_location = Point.new(5, 3)
    current_battery_level = Battery.new(0.5)

    expect(Trip.new(current_location, future_location, current_battery_level).trip_length).to eq(8)
    end
  end
end
