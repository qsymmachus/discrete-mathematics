module NumberFinder
  class << self
    def find_n_numbers(n, num = 1, found =[], &predicate)
      if found.size == n
        found
      elsif predicate.call(num)
        find_n_numbers(n, num + 1, found + [num], &predicate)
      else
        find_n_numbers(n, num + 1, found, &predicate)
      end
    end

    def find_numbers(range, &predicate)
      range.select { |num| predicate.call(num) }
    end

    def find_factors(num)
      (1..num).select do |divisor| 
        num % divisor == 0 && num != divisor
      end
    end

    def is_perfect?(num)
      num == find_factors(num).reduce(&:+)
    end
  end
end

puts "Finding the first four perfect numbers:"
puts NumberFinder.find_n_numbers(4) { |num| NumberFinder.is_perfect? num }
puts "\n"

puts "Finding all numbers between 1 and 1000 with exactly 3 factors:"
puts NumberFinder.find_numbers((1..1000)) { |num| NumberFinder.find_factors(num).size == 3 }
