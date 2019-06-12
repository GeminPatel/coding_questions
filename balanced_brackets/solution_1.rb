#!/bin/ruby

require 'json'
require 'stringio'

# Complete the isBalanced function below.
def isBalanced(s)
  stack = []; length = s.length; 
  map = { '}' => '{', ')' => '(', ']' => '[' }
  open_brackets = map.values

  length.times do |index|
    if open_brackets.include? s[index]
      stack.push(s[index])
    else
      return 'NO' if stack.pop != map[s[index]]
    end
  end

  return stack.length == 0 ? 'YES' : 'NO'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    s = gets.to_s.rstrip

    result = isBalanced s

    fptr.write result
    fptr.write "\n"
end

fptr.close()

