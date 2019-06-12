class NFibonacci
  def self.print(input)
    p fib(input)
  end

  private

  def self.fib(input)
    if input == 0 || input == 1
      input
    else
      fib(input - 1) + fib(input - 2)
    end
  end
end

input = gets.strip.chomp.to_i

NFibonacci.print(input)