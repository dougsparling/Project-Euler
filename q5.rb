require 'prime'
require 'mathn'

N = 10

product = 1
2.upto N do |x|
  # remove all factors of x that are already present before folding in
  2.upto x do |y|
    product /= y if product.divisible_by? y and x.divisible_by? y
  end
  product *= x unless product.divisible_by? x
end

result = 1
2.upto N do |x|
  result = result.lcm x
end

puts "1st #{product}"
puts "2nd #{result}"