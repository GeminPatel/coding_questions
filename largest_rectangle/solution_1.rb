#!/bin/ruby

require 'json'
require 'stringio'

# Complete the largestRectangle function below.
def largestRectangle(h)
  stack = [0]; length = h.length; h << 0; area = 0; index = 1

  while index <= length do
    if stack.empty? || h[index] > h[stack[-1]]
      stack << index
      index += 1
    else
      element_index = stack.pop
      t_area = h[element_index] * (stack.empty? ? index : (index - stack[-1] -1))
      area = [area, t_area].max
    end
  end

  return area
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

h = gets.rstrip.split(' ').map(&:to_i)

result = largestRectangle h

fptr.write result
fptr.write "\n"

fptr.close()

