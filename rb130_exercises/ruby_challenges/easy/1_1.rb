# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
# An equilateral triangle has all three sides the same length.
# An isosceles triangle has exactly two sides of the same length.
# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, 
# and the sum of the lengths of any two sides must be greater than the length of the third side.



# I: 3 integers 
# O: determine if scalene, isoceles or equalateral tri OR not a triangle 


# E: 
# p triangle_type(7, 7, 7) == "Equilateral"
# p triangle_type(7, 7, 5) == "Isosceles"
# p triangle_type(7, 5, 4) == "Scalene"
# p triangle_type(7, 9, 1) == "Not a triangle"
# p triangle_type(7, 0, 7) == "Not a triangle"


# D: array 

# Algo: 
# - set tringle_sides equal to an array of the 3 inputs 
# - if all values are the same, return "Equilateral"
# - if only two values are the same && the third value is less than the sum of the two similar values, return "Isosceles"
# - if no values are similar, return "Scalene"
# - if any value is zero, return "Not a triangle"
# - return "Scalene"


# Important details we need to keep in mind:

#     To be a valid triangle, each side length must be greater than 0.
#     To be a valid triangle, the sum of the lengths of any two sides must be greater than the length of the remaining side.
#     An equilateral triangle has three sides of equal length.
#     An isosceles triangle has exactly two sides of the equal length.
#     A scalene triangle has three sides of unequal length (no two sides have equal length).



class Triangle 
  def initialize(one, two, three)
    @tri = [one, two, three]
    raise ArgumentError.new "Invalid triangle" if invalid?
  end

  def kind 
    return 'equilateral' if tri.uniq.size == 1
    return 'isosceles' if tri.uniq.size == 2
    'scalene'
  end

  private 
  attr_reader :tri

  def invalid?
    tri.include?(0) || tri.min(2).sum <= tri.max
  end
end

# 

require 'minitest/autorun'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2
    assert_raises(ArgumentError) do
      triangle = Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_4
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 2)
    end
  end
end
