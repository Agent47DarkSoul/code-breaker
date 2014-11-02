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
      secret = @secret.split('')
      @guess.split('').inject(0) do |count, guess_number|
        count + (delete_first(secret, guess_number) ? 1 : 0)
      end
    end

    private

    # Check whether the number at the position is exact match
    def exact_match?(position)
      @guess[position] === @secret[position]
    end

    def delete_first(code, n)
      i = code.index(n)
      code.delete_at(i) if i
    end
  end
end