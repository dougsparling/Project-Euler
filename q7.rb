require 'prime'
generator = PrimeGenerator.new

N = 10001

(N-1).times do
  generator.next
end

puts generator.next