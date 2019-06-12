class Permutation
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def print
    permutation(input, 0, input.length)
  end

  private

  def permutation(input, start, finish)
    if start == finish
      puts input
    else
      for i in (start..finish-1)
        input[i], input[start] = input[start], input[i]
        permutation(input, start + 1, finish)
        input[i], input[start] = input[start], input[i]
      end
    end
  end
end

input = gets.chomp.strip

Permutation.new(input).print
