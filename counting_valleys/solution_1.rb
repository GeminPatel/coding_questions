#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countingValleys function below.
def countingValleys(n, s)
  num_valleys = 0; current_height = 0;

  s.split('').each do |step|
    if step == 'U'
      current_height += 1
      num_valleys += 1 if current_height == 0
    else
      current_height -= 1
    end
  end

  num_valleys
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = countingValleys n, s

fptr.write result
fptr.write "\n"

fptr.close()

