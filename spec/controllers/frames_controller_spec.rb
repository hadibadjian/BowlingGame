require 'spec_helper'
require 'bowling_game/controllers/frames'

RSpec.describe BowlingGame::Controllers::Frames do

  context "correct frames" do

    before(:each) do
      @frames = "4,6 > 5,0".split('>').map(&:strip)
      @controller = BowlingGame::Controllers::Frames.new @frames
    end

    it "should return correct number of frames" do
      expect(@controller.number_of_frames).to eql(@frames.count)
    end

    it "should parse frames correctly" do
      expect(@controller.next_frame).to be_kind_of(BowlingGame::Models::Frame)
    end

  end

end
