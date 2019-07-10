require 'battery'

RSpec.describe Battery do
  describe ".new" do
    it 'uses the sensor reading to set the battery level' do
      expect(Battery.new(0.5).battery_level).to eq(50)
    end
  end

  describe '#to_percentage' do
    it "returns the current percentage of the battery as a string" do
      expect(Battery.new(0.7).to_percentage).to eq("70%")
    end
  end

  describe 'forecast_drain' do
    it 'forcasts the level of battery drain' do
      expect(Battery.new(1.0).forecast_drain).to eq(99)
    end
  end

  describe '#actual_drain' do
    it 'reduces the level of the battery' do
      expect(Battery.new(1.0).actual_drain).to be_between(98, 99.5)
    end
  end
end
