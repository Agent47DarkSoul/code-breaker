module Codebreaker
  class Marker
    def initialize(secret, guess, options = {})
      @secret = secret
      @guess = guess
      @digits = options[:digits] || 4;
    end

    # Count exact matches
    def exact_match_count
      (0...@digits).inject(0) do |count, index|
        exact_match?(index) ? count += 1 : count
      end
    end

    # Count number matches
    def number_match_count
      total_match_count - exact_match_count
    end

    # Count the total unique matches of numbers
    def total_match_count
      count = 0
      secret = @secret.split('')

      @guess.split('').map do |guess_number|
        if secret.include? guess_number
          secret.delete_at(secret.index(guess_number))
          count += 1
        end
      end

      count
    end

    private
    
      # Check whether the number at the position is exact match
      def exact_match?(position)
        @guess[position] === @secret[position]
      end

      # Check whether the number at the position is a number match
      def number_match?(position)
        @secret.include?(@guess[position]) && !exact_match?(position)
      end
  end
end