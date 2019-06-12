# KADANE's Algorithm

#!/bin/ruby

require 'json'
require 'stringio'

def _max_subarray(arr)
  current_max = 0
  global_max = arr[0]
  
  (0...arr.length).each do |index|
    current_max += arr[index]
    
    current_max = arr[index] if current_max < arr[index]
    
    global_max = current_max if global_max < current_max

    puts "i: #{index} | e: #{arr[index]} | cm: #{current_max} | gm: #{global_max}"
  end

  global_max
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

