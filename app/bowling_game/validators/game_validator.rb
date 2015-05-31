module BowlingGame

  module Validators

    class GameValidator

      def valid?(frames, parser)
        @errors = []
        frames = parser.parse frames
        valid_frames?(frames) && valid_frames_count?(frames)
      end

      def errors
        @errors
      end

      private

        def valid_frames?(frames)
          validity = frames.map(&:valid?).inject(:&)
          frames.each { |frame| @errors.push "frame #{frame.rolls} is invalid" unless frame.valid? }
          validity
        end

        def valid_frames_count?(frames)
          @errors.push 'invalid number of frames' if (frames.count > 12)
          frames.count < 13
        end

    end

  end

end
