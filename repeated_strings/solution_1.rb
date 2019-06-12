#!/bin/ruby

require 'json'
require 'stringio'

def count_a(s)
  s.count('a')
end

# Complete the repeatedString function below.
def repeatedString(s, n)
  length = s.length

  repeat_count = n / length

  remainder = n % length

  count_a(s) * repeat_count + count_a(s[0...remainder])
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

n = gets.to_i

result = repeatedString s, n

fptr.write result
fptr.write "\n"

fptr.close()

