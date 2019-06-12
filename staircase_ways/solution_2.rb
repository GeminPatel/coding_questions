#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stepPerms function below.
def stepPerms(n, store)
  return 0 if n < 0
  return 1 if n == 0
  
  return store[n] if store[n]

  store[n] = stepPerms(n - 1, store) + stepPerms(n - 2, store) + stepPerms(n - 3, store)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_i

s.times do |s_itr|
    n = gets.to_i
    store = {}
    res = stepPerms(n, store)

    fptr.write res % 10000000007
    fptr.write "\n"
end

fptr.close()

