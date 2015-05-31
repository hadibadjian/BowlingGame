require 'spec_helper'
require 'bowling_game/parsers/simple_parser'
require 'bowling_game/validators/game_validator'

RSpec.describe BowlingGame::Validators::GameValidator do

  before(:each) do
    @parser = BowlingGame::Parsers::SimpleParser.new
    @validator = BowlingGame::Validators::GameValidator.new
  end

  context "valid game frames" do

    it "should be valid" do
      @frames = "4,5 > 10 > 10 > 1,0".split('>').map(&:strip)
      expect(validation).to be_truthy
    end

  end

  context "invalid game frames" do

    before(:each) do
      @frames = '10 > 5,6 > 11'.split('>').map(&:strip)
    end

    it "should be invalid" do
      expect(validation).to be_falsey
    end

    it "should have errors" do
      validation
      expect(@validator.errors).not_to be_empty
    end

    it "should have correct number of errors" do
      validation
      expect(@validator.errors.count).to eql(2)
    end

  end

end

def validation
  @validator.valid? @frames, @parser
end
