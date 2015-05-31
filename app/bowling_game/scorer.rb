module BowlingGame

  class Scorer

    attr_accessor :current_score

    def calculate(frames_controller)
      @current_score = 0

      return unless frames_controller

      while frame = frames_controller.next_frame
        first_roll, second_roll = look_ahead_rolls frames_controller

        frame.score = frame_score frame, {
            first_roll: first_roll,
            second_roll: second_roll
          }

        @current_score += frame.score if frame.score
      end
    end

    private

      def look_ahead_rolls(frames_controller)
        one_frame_ahead = frames_controller.peek(1)
        two_frame_ahead = frames_controller.peek(2)

        look_ahead_rolls = []
        look_ahead_rolls = one_frame_ahead.rolls unless one_frame_ahead.nil?
        look_ahead_rolls += two_frame_ahead.rolls unless two_frame_ahead.nil?

        look_ahead_rolls[0..1]
      end

      def frame_score(frame, look_ahead_rolls = {})
        raise 'invalid frame!' unless frame.valid?

        first_roll  = look_ahead_rolls[:first_roll]
        second_roll = look_ahead_rolls[:second_roll]

        if frame.strike?
          frame.rolls_sum + first_roll.to_i + second_roll.to_i if first_roll and second_roll
        elsif frame.spare?
          frame.rolls_sum + first_roll.to_i if first_roll
        else
          frame.rolls_sum
        end
      end

  end

end
