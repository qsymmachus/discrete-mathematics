module Prime
  class << self
    def is_prime?(n)
      (2..(n - 1)).each do |divisor|
        return false if n % divisor == 0
      end

      true
    end
  end
end
