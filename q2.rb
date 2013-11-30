class Fibbonacci
  def initialize 
    @previous = 0
    @current = 1
  end
  
  def next
    previous_curr = @current
    @current = (@previous + @current)
    @previous = previous_curr
    return @current
  end
end

gen = Fibbonacci.new

last = gen.next
sum = 0
while last < 1_000_000
  sum += last if last % 2 == 0 
  last = gen.next
end

puts "Answer: #{sum}"