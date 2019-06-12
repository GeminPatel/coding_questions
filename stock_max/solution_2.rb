#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stockmax function below.
def stockmax(prices)
  current_max = prices.last
  profit = 0

  prices.length.times do |number|
    index = prices.length - number - 1
    
    if prices[index] == current_max
      next
    elsif prices[index] < current_max
      profit += current_max - prices[index]
    else
      current_max = prices[index]
    end
  end

  return profit
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    prices = gets.rstrip.split(' ').map(&:to_i)

    result = stockmax prices

    fptr.write result
    fptr.write "\n"
end

fptr.close()

