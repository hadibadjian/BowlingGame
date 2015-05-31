module BowlingGame

  module Models

    class Frame

      attr_accessor :rolls
      attr_accessor :score

      def initialize(input)
        @rolls = input.split(',').map(&:to_i)
      end

      def number_of_rolls
        @rolls.count
      end

      def valid?
        case @rolls.count
        when 1
          return rolls_sum == 10
        when 2
          return rolls_sum < 11
        else
          return false
        end
      end

      def spare?
        valid? && (@rolls.inject(:+) == 10)
      end

      def strike?
        valid? && (@rolls.first == 10)
      end

      def rolls_sum
        @rolls.inject(:+)
      end

    end

  end

end
