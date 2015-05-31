require 'bowling_game/models/frame'

module BowlingGame

  module Parsers

    class SimpleParser

      def parse(frames)
        frames.map { |frame| BowlingGame::Models::Frame.new frame }
      end

    end

  end

end
