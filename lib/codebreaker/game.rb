module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret

      @output.puts "Welcome to Codebreaker!"
      @output.puts "Enter guess:"
    end

    def guess(guess)
      @output.puts ('+' * exact_match_count(guess)) + ('-' * number_match_count(guess))
    end

    private

      GUESS_DIGIT_COUNT = 4

      # Check whether the number at the position is exact match
      def exact_match?(guess, position)
        guess[position] === @secret[position]
      end

      # Check whether the number at the position is a number match
      def number_match?(guess, position)
        @secret.include?(guess[position]) && !exact_match?(guess, position)
      end

      # Count exact matches
      def exact_match_count(guess)
        (0...GUESS_DIGIT_COUNT).inject(0) do |count, index|
          exact_match?(guess, index) ? count += 1 : count
        end
      end

      # Count number matches
      def number_match_count(guess)
        (0...GUESS_DIGIT_COUNT).inject(0) do |count, index|
          number_match?(guess, index) ? count += 1 : count
        end
      end
  end
end