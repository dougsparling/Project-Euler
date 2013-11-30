require 'prime'

puts "Number for which to find the highest factor:"
number = gets.to_i

# create prime number generator and start with first prime
prime_generator = PrimeGenerator.new
prime = 0

# loop until the number is surpassed by the prime
while number > prime
  
  # get the next prime and repeat
  prime = prime_generator.next
  
  # remove as many prime factors as possible 
  number /= prime while number.divisible_by? prime  
end

puts "Highest factor is #{prime}"