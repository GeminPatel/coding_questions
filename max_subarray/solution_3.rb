# Missed one test case

#!/bin/ruby

require 'json'
require 'stringio'

def sum(arr, start, finish)
  sum = 0

  (finish - start + 1).times do |offset|
    sum += arr[start + offset]
  end

  sum
end

def _max_subarray(arr)
  # i = start
  # j = finish
  # dp[i][j] = max_subarray = max(dp[i][j - 1], dp[i+1][j], sum[i,j])

  dp = Array.new(arr.length) { Array.new(arr.length, 0) }

  (1..arr.length).each do |length|
    (0...(arr.length - length + 1)).each do |start|
      finish = start + length - 1
      
      if start == finish
        value = arr[start]
      elsif start > finish
        value = 0
      else
        value = [dp[start][finish - 1], dp[start + 1][finish], sum(arr, start, finish)].max
      end
      
      dp[start][finish] = value
    end
  end

  dp[0][arr.length - 1]
end

def _max_subsequence(arr)
  subsequence = arr.select do |element|
    element > 0
  end

  subsequence.empty? ? arr.max : subsequence.sum
end

# Complete the maxSubarray function below.
def maxSubarray(arr)
  [_max_subarray(arr), _max_subsequence(arr)]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    arr = gets.rstrip.split(' ').map(&:to_i)

    result = maxSubarray arr

    fptr.write result.join " "
    fptr.write "\n"
end

fptr.close()

