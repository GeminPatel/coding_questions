#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stepPerms function below.
def stepPerms(n)
  # dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
  
  dp = Array.new(n + 1, 0)
  dp[0] = 1 # when number of steps are 0 there is only 1 way
  
  (1..n).each do |i|
    dp[i] += dp[i - 1] if i - 1 >= 0
    dp[i] += dp[i - 2] if i - 2 >= 0
    dp[i] += dp[i - 3] if i - 3 >= 0
  end

  dp[n]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_i

s.times do |s_itr|
    n = gets.to_i
    store = {}
    res = stepPerms n

    fptr.write res % 10000000007
    fptr.write "\n"
end

fptr.close()

