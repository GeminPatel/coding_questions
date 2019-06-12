# Missed one test case

#!/bin/ruby

require 'json'
require 'stringio'

def _max_subarray(arr, start, finish)
  return 0 if start > finish
  return arr[start] if start == finish 

  [_max_subarray(arr, start, finish - 1), _max_subarray(arr, start + 1, finish), arr[start..finish].sum].max
end

def _max_subsequence(arr)
  subsequence = arr.select do |element|
    element > 0
  end

  subsequence.empty? ? arr.max : subsequence.sum
end

# Complete the maxSubarray function below.
def maxSubarray(arr)
  [_max_subarray(arr, 0, arr.length - 1), _max_subsequence(arr)]
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

