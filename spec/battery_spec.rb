require 'battery'
RSpec.describe Battery do
  describe ".new" do
    it "takes a sensor reading" do
      expect(Battery.new(0)).to be
    end
  end

  describe "#battery_percentage" do
    it "returns the current percentage of the battery" do
      expect(Battery.new(0.7).percentage).to eql("70%")
    end
  end

  describe "#reduce_battery" do
    it "reduces the level of the battery" do
      expect(Battery.new(1.0).reduce_battery_level).to eql(99.0)
    end
  end
end
