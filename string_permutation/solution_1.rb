class Permutation
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def print
    permutation(input, '')
  end

  private

  def permutation(rem, prefix)
    if rem.length == 0
      puts prefix
    else
      rem.each_char.with_index do |c, i|
        new_rem = rem[0, i] + rem[i+1..-1]
        permutation(new_rem, prefix + c)
      end
    end
  end
end

input = gets.chomp.strip

Permutation.new(input).print