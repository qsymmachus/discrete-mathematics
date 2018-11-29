require 'minitest/autorun'
require_relative 'prime'

class PrimeTest < Minitest::Test
  def test_is_prime_returns_true_if_prime
    primes = [2, 3, 5, 7, 7919]

    primes.each do |prime| 
      assert Prime.is_prime?(prime)
    end
  end

  def test_is_prime_returns_false_if_composite
    composites = [4, 6, 12, 48, 105, 22000]

    composites.each do |composite| 
      refute Prime.is_prime?(composite)
    end
  end
end
