require 'spec_helper'
require 'bowling_game/models/frame'

RSpec.describe BowlingGame::Models::Frame do

  context "correct input" do

    before(:each) do
      @input = "1,6"
      @frame = BowlingGame::Models::Frame.new @input
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

    it "should have correct score" do
      expect(@frame.score).to eql(7)
    end

  end

  context "spare" do

    before(:each) do
      @input = "3,7"
      @frame = BowlingGame::Models::Frame.new @input
    end

    it "should be spare" do
      expect(@frame.spare?).to be_truthy
    end

  end

  context "strike" do

    before(:each) do
      @input = "10"
      @frame = BowlingGame::Models::Frame.new @input
    end

    it "should be strike" do
      expect(@frame.strike?).to be_truthy
    end

  end

  context "incorrect input" do

    before(:each) do
      @input = "5,6"
      @frame = BowlingGame::Models::Frame.new @input
    end

    it "should have a invalid status" do
      expect(@frame.valid?).to be_falsey
    end

  end

end

def rolls(input)
  input.split(',').map(&:to_i)
end
