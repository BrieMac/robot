require 'room'

RSpec.describe Room do
  describe ".new" do
    it "takes a name" do
      expect(Room.new("Bathroom")).to be
    end
  end

  describe "#name" do
    it "returns the name of the room" do
      expect(Room.new("Bedroom").name).to eql("Bedroom")
    end
  end
end
