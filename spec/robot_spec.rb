require 'robot'
RSpec.describe Robot do
  describe ".new" do
    it "takes a name and starting point and battery" do
      expect(Robot.new("Fredrick", double, double)).to be
    end
  end
end
