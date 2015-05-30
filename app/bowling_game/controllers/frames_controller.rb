require 'bowling_game/models/frame'

module BowlingGame

  module Controllers

    class FramesController

      attr_accessor :current_frame_index

      def initialize(frames)
        @frames = frames.map { |frame| BowlingGame::Models::Frame.new frame }
        @current_frame_index = -1
      end

      def number_of_frames
        @frames.count
      end

      def next_frame
        @current_frame_index += 1
        @frames[@current_frame_index]
      end

      def peek(steps)
        @frames[@current_frame_index + steps]
      end

    end

  end

end
