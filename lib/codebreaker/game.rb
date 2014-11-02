module Codebreaker
  # Represents the entire game
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret

      display('Welcome to Codebreaker!')
      display('Enter guess:')
    end

    def guess(guess)
      marker = Marker.new(@secret, guess, digits: GUESS_DIGIT_COUNT)
      display(marks(marker))
    end

    private

    def display(message)
      @output.puts(message)
    end

    def marks(marker)
      ('+' * marker.exact_match_count) + ('-' * marker.number_match_count)
    end

    GUESS_DIGIT_COUNT = 4
  end
end
