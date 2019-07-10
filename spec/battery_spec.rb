require 'battery'

RSpec.describe Battery do
  let(:battery) { Battery.new(0.9) }

  describe '.new' do
    it 'uses the sensor reading to set the battery level' do
      expect(battery.battery_level).to eq(90)
    end
  end

  describe '#to_percentage' do
    it 'returns the current percentage of the battery as a string' do
      expect(battery.to_percentage).to eq('90%')
    end
  end

  describe 'forecast_drain' do
    it 'forcasts the level of battery drain' do
      expect(battery.forecast_drain).to eq(89)
    end
  end

  describe '#actual_drain' do
    it 'reduces the level of the battery' do
      expect(battery.actual_drain).to be_between(88, 89.5)
    end
  end
end
