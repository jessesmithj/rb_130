# frozen_string_literal: true

class PerfectNumber
  def self.classify(num)
    raise StandadError if num.negative?

    arr = (1...num).select do |n|
      (num % n).zero?
    end

    aliquot_sum = arr.reduce(&:+)
    if aliquot_sum < num
      return 'deficient'
    elsif aliquot_sum > num
      return 'abundant'
    end

    'perfect'
  end

  private 

  def private_method
    "some code"
  end 
end
