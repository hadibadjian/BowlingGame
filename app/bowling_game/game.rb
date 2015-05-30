require 'bowling_game/controllers/frames'
require 'bowling_game/scorer'

module BowlingGame

  class Game

    def initialize
      @scorer = BowlingGame::Scorer.new
    end

    def roll(frames)
      @frames_controller = BowlingGame::Controllers::Frames.new frames
    end

    def score
      @scorer.calculate @frames_controller
      @scorer.current_score
    end

  end

end
