#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stepPerms function below.
def stepPerms(n)
  return 0 if n < 0
  return 1 if n == 0
  
  stepPerms(n - 1) + stepPerms(n - 2) + stepPerms(n - 3)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_i

s.times do |s_itr|
    n = gets.to_i

    res = stepPerms n

    fptr.write res % 10000000007
    fptr.write "\n"
end

fptr.close()

