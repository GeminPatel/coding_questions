#!/bin/ruby

require 'json'
require 'stringio'

# Complete the getWays function below.
def getWays(n, c)
  # i = n or change needed
  # j = enabled coins
  # dp[i][j] = dp[i - j's coin value][j] + dp[i][j - 1]
  store = [[1] * c.length]

  (1..n).each do |i|
    c.length.times do |j|
      sum_one = i - c[j] >= 0 ? store[i - c[j]][j] : 0
      sum_two = j - 1 >= 0 ? store[i][j - 1] : 0
      store[i] = [] unless store[i]
      store[i][j] = sum_one + sum_two
    end
  end

  store.last.last
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

c = gets.rstrip.split(' ').map(&:to_i)

# Print the number of ways of making change for 'n' units using coins having the values given by 'c'

store = {}

ways = getWays n, c

fptr.write(ways)

fptr.close()

