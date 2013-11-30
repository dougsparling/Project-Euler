module Enumerable
  def sum_of_squares
    inject(0) { |x, y| y ** 2 + x }
  end
  
  def square_of_sum
    inject(0) { |x, y| x + y} ** 2
  end
end

N = 100

puts (1..N).square_of_sum - (1..N).sum_of_squares