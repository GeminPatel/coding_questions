#!/bin/ruby

require 'json'
require 'stringio'

def max_and_index(prices, start)
  max = prices[start]; max_index = start
  
  (start...prices.length).each do |index|
    if prices[index] > max
      max = prices[index]
      max_index = index
    end
  end

  [max, max_index]
end

def profit_sum(prices, buy_index, sell_index)
  return 0 if buy_index >= sell_index

  buy_sum = 0

  (buy_index...sell_index).each do |index|
    buy_sum += prices[index]
  end

  ((sell_index - buy_index) * prices[sell_index]) - buy_sum
end

# Complete the stockmax function below.
def stockmax(prices, start)
  return 0 if prices[start..-1].length <= 1

  max, max_index = max_and_index(prices, start)
  
  return profit_sum(prices, start, max_index) + stockmax(prices, max_index + 1)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    prices = gets.rstrip.split(' ').map(&:to_i)

    result = stockmax(prices, 0)

    fptr.write result
    fptr.write "\n"
end

fptr.close()

