#!/bin/ruby

require 'json'
require 'stringio'

# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c)
  number_of_jumps = 0; index = 0
  
  while index < c.length - 2
    if c[index + 2] == 0
      index += 2
    else
      index += 1
    end

    number_of_jumps += 1
  end

  number_of_jumps += 1 if index == c.length - 2

  number_of_jumps
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

c = gets.rstrip.split(' ').map(&:to_i)

result = jumpingOnClouds c

fptr.write result
fptr.write "\n"

fptr.close()

