class Numeric
  
  # assumes either a single number or an increasing array
  def divisible_by?(numbers)
    numbers = [numbers] unless numbers.is_a? Array
    sqrt = Math.sqrt(self)
    for number in numbers
      return true if self % number == 0
      break if sqrt < number # optimization
    end
    return false
  end
end

class PrimeGenerator
  def initialize
    @current = 1
    @primes = []
  end
  
  def next
    advance!
    @current
  end
  
  protected
  
  def advance!
    @current += 1
    @current += 1 while (@current.divisible_by?(@primes))
    @primes << @current
  end
end