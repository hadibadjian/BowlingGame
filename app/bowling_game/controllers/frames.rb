require 'bowling_game/models/frame'

module BowlingGame

  module Controllers

    class Frames

      attr_accessor :current_frame_index

      def initialize(frames)
        @frames = frames.map { |frame| BowlingGame::Models::Frame.new frame }
        @current_frame_index = 0
      end

      def number_of_frames
        @frames.count
      end

      def next_frame
        return nil unless in_bound @current_frame_index
        frame = @frames[@current_frame_index]
        @current_frame_index += 1
        frame
      end

      def peek(steps)
        index = (@current_frame_index + steps)
        return nil unless in_bound index
        @frames[index]
      end

      private

        def in_bound(index)
          (0..(number_of_frames - 1)).include? index
        end

    end

  end

end
