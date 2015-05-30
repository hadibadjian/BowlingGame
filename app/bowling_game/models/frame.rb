module BowlingGame

  module Models

    class Frame

      attr_accessor :rolls
      attr_accessor :score

      def initialize(input)
        @input = input
        @rolls = @input.split(',').map(&:to_i)
        @score = sum
      end

      def number_of_rolls
        @rolls.count
      end

      def valid?
        ((1..2).include? @rolls.count) && (sum < 11)
      end

      def spare?
        (@rolls.inject(:+) == 10) && (@rolls.count == 2)
      end

      def strike?
        (@rolls.first == 10) && (@rolls.count == 1)
      end

      private

        def sum
          @rolls.inject(:+)
        end

    end

  end

end
