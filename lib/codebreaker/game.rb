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
      number_match = exact_match = 0
      
      guess.chars.each_with_index do |number, index|
        if exact_match?(guess, index)
          exact_match += 1
        elsif number_match?(guess, index)
          number_match += 1
        end
      end
      
      @output.puts generate_mark(exact_match, number_match)
    end

    private

      def exact_match?(guess, position)
        guess[position] === @secret[position]
      end

      def number_match?(guess, position)
        @secret.include?(guess[position])
      end

      # generates the mark signs depending on exact and number match
      def generate_mark(exact_match, number_match)
        mark = ''
        exact_match.times { mark += '+' }
        number_match.times { mark += '-' }  
        return mark
      end
  end
end