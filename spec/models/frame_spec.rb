require 'spec_helper'
require 'bowling_game/models/frame'

RSpec.describe BowlingGame::Models::Frame do

  context "correct input" do

    before(:each) do
      @input = "1,6"
      @frame = frames @input
    end

    it "should be parsed correctly" do
      expect(@frame.number_of_rolls).to eql(rolls(@input).count)
    end

    it "should give correct roll scores" do
      expect(@frame.rolls.first).to eql(rolls(@input).first)
    end

    it "should have valid status" do
      expect(@frame.valid?).to be_truthy
    end

  end

  context "spare" do

    it "should be spare" do
      frame = frames "3,7"
      expect(frame.spare?).to be_truthy
    end

  end

  context "strike" do

    it "should be strike" do
      frame = frames "10"
      expect(frame.strike?).to be_truthy
    end

  end

  context "incorrect input" do

    it "should have a invalid status" do
      frame = frames "5,6"
      expect(frame.valid?).to be_falsey
    end

  end

end

def rolls(input)
  input.split(',').map(&:to_i)
end

def frames(input)
  BowlingGame::Models::Frame.new input
end
