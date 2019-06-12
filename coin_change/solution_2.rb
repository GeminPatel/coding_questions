#!/bin/ruby

require 'json'
require 'stringio'

# Complete the getWays function below.
def getWays(n, c, pointer, store)
  return 1 if n == 0
  return 0 if pointer < 0 || n < 0

  return store[n][pointer] if store[n] && store[n][pointer]

  store[n] = [] unless store[n]
  
  ways = getWays(n - c[pointer], c, pointer, store) + getWays(n, c, pointer - 1, store)

  store[n][pointer] = ways
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

c = gets.rstrip.split(' ').map(&:to_i)

# Print the number of ways of making change for 'n' units using coins having the values given by 'c'

store = {}

ways = getWays n, c, c.length - 1, store

fptr.write(ways)

fptr.close()

