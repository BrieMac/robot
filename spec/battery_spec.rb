require 'battery'
RSpec.describe Battery do
  describe ".new" do
    it "takes a sensor reading" do
      expect(Battery.new(0)).to be
    end

    it 'sets battery level to the starting battery level' do
      expect(Battery.new(0.5).battery_level).to eq(50)
    end
  end

  describe "#battery_to_percentage" do
    it "returns the current percentage of the battery" do
      expect(Battery.new(0.7).to_percentage).to eq("70%")
    end
  end

  describe "#reduce_battery" do
    it "reduces the level of the battery" do
      expect(Battery.new(1.0).actual_drain).to be_between(98, 99.5)
    end
  end
end
