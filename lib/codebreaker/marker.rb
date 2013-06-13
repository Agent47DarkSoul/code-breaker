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
      (0...@digits).inject(0) do |count, index|
        number_match?(index) ? count += 1 : count
      end
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