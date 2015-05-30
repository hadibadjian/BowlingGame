module BowlingGame

  class Scorer

    attr_accessor :current_score

    def calculate(frames_controller)
      @current_score = 0
      while frame = frames_controller.next_frame
        first_roll, second_roll = look_ahead_scores frames_controller

        if frame.strike?
          frame.score = frame.sum + first_roll.to_i + second_roll.to_i if first_roll and second_roll
        elsif frame.spare?
          frame.score = frame.sum + first_roll.to_i if first_roll
        else
          frame.score = frame.sum
        end

        @current_score += frame.score if frame.score
      end
    end

    private

      def look_ahead_scores(frames_controller)
        next_one_frame    = frames_controller.peek(1)
        next_second_frame = frames_controller.peek(2)

        look_ahead_scores = []
        look_ahead_scores = next_one_frame.rolls unless next_one_frame.nil?
        look_ahead_scores += next_second_frame.rolls unless next_second_frame.nil?

        look_ahead_scores[0..1]
      end

  end

end
