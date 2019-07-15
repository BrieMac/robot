require 'trip'

RSpec.describe Trip do
  let(:battery) { Battery.new(0.5) }
  let(:current_location) { Point.new(0, 0) }
  let(:future_location) { Point.new(5, 3) }

  describe '.new' do
    it 'takes an existing battery object and checks its battery level' do
      trip = Trip.new(double, double, battery)

      expect(trip.current_battery_level).to eq(battery.battery_level)
    end
  end

  describe '#forecast' do
    context 'if the robot will be able to make the trip' do
      it 'return a sucess message' do
      trip = Trip.new(current_location, future_location, battery)

      expect(trip.forecast).to eq('When I arrive at co-ordinate 5, 3 I will have 42% battery remaining')
      end
    end

    context 'if the robot will not be able to make the trip' do
      it 'return a failure message' do
        future_location = Point.new(20, 80)
        trip = Trip.new(current_location, future_location, battery)

        expect(trip.forecast).to eq("I don't have sufficient battery to travel to co-ordinate 20, 80")
      end
    end

    context 'if the future coordinates are negative numbers' do
      let(:battery) { Battery.new(0.5) }
      let(:current_location) { Point.new(0, 0) }
      let(:future_location) { Point.new(-5, -5) }

      it 'drains the battery the correct number of times' do
        expect(Trip.new(current_location, future_location, battery).forecast_battery_level).to eq(40.00)
      end
    end

    context 'if the future coordinates are negative numbers and the current coordinates are positive' do
      let(:battery) { Battery.new(0.5) }
      let(:current_location) { Point.new(3, 3) }
      let(:future_location) { Point.new(-5, -5) }

      it 'drains the battery the correct number of times' do
        expect(Trip.new(current_location, future_location, battery).forecast_battery_level).to eq(34.00)
      end
    end
  end

  describe '#forecast_battery_level' do
    it 'estimates battery usage based upon trip length' do
      trip = Trip.new(current_location, future_location, battery)

      expect(trip.forecast_battery_level).to eq(42)
    end
  end

  describe '#actual_battery_level' do
    it 'reports battery usage based upon trip length' do
      trip = Trip.new(current_location, future_location, battery)

      expect(trip.actual_battery_level).to be_between(34, 46)
    end
  end
end
