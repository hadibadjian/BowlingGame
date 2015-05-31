require 'bowling_game/controllers/frames_controller'
require 'bowling_game/validators/game_validator'
require 'bowling_game/parsers/simple_parser'
require 'bowling_game/scorer'

module BowlingGame

  class Game

    def initialize
      @scorer    = BowlingGame::Scorer.new
      @validator = BowlingGame::Validators::GameValidator.new
      @parser    = BowlingGame::Parsers::SimpleParser.new
    end

    def roll(frames)
      return @validator.errors unless @validator.valid? frames, @parser

      @controller = BowlingGame::Controllers::FramesController.new frames, @parser
    end

    def score
      @scorer.calculate @controller
      @scorer.current_score
    end

  end

end
