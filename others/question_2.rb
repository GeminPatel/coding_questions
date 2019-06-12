require 'pp'

input_data = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5]
t = 1

class MaxwellTransform
	attr_accessor :array

  def initialize(data)
    dimension = Math.sqrt(data.length)
    self.array = data.each_slice(dimension).to_a
    @level = (dimension / 2.0).ceil
  end

  def print_array
    pp array
  end

  def transform
    @level.times do |level|
      
    end
  end
end


transformer = MaxwellTransform.new(input_data)
transformer.print_array
