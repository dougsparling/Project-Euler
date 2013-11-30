def largest_palindrome_product
  highest = 0
  highest_factors = 0, 0
  999.downto 100 do |i|
     999.downto i do |j|
      product = i * j
      highest = product and highest_factors = [i, j] if highest < product and palindrome(product)
    end
  end
  highest_factors
end

def palindrome(n)
  str = n.to_s
  str == str.reverse
end

x, y = largest_palindrome_product

puts "Answer: #{x} times #{y} is #{x*y}"