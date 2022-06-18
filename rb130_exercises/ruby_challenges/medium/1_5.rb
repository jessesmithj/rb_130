# Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, 
# often used in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list. Each element in the list 
# contains data and a "next" field pointing to the next element in the list of elements. 
# This variant of linked lists is often used to represent sequences or push-down stacks 
# (also called a LIFO stack; Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of data such 
# as the numbers 1-10. Provide functions to reverse the linked list and convert a linked list to and from an array.

# linked list FIFO 
# value 1, points to 2
# value 2, points to 3
# value 3, points to 4 
# value 4, points to nil 

# head is first value 

# linked list LIFO 
# value 1, points to nil 
# value 2, points to 1
# value 3, points to 2 
# etc. 

# head is always newest value added 
# which is also the first to get removed (pop)


class Element 
  attr_accessor :value, :next

  def initialize(value, next_value = nil)
    @value = value
    @next = next_value
  end

  def datum
    @value
  end

  def tail?
    true if @next.nil?
  end
end


class SimpleLinkedList 
  attr_reader :head

  def initialize
    @head = nil
  end 

  def size 
    size = 0 
    current_elem = head 

    while (current_elem)
      size += 1 
      current_elem = current_elem.next
    end
    size
  end
  
  def empty?
    head.nil?
  end 

  def peek
    return nil if head.nil?
    head.value
  end 

  def push(data)
    new_head =  Element.new(data)
    new_head.next = head 
    @head = new_head
  end

  def pop
    value_to_pop = head.value
    @head = head.next
    value_to_pop
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?

    arr.reverse.each { |elem| list.push(elem) }
    list 
  end

  def to_a
    array = [] 
    return array if self.head.nil?
    dup_list = self.dup

    loop do 
      array << dup_list.pop 
      break if dup_list.head == nil 
    end 
    array
  end 

  def reverse
    rev_arr = self.to_a.reverse
    rev_linked_list = SimpleLinkedList.from_a(rev_arr)
  end 

end



require 'minitest/autorun'
# require_relative 'simple_linked_list'

class LinkedListTest < Minitest::Test
  def test_element_datum
    element = Element.new(1)
    assert_equal 1, element.datum
  end

  def test_element_tail
    element = Element.new(1)
    assert element.tail?
  end

  def test_element_next_default
    element = Element.new(1)
    assert_nil element.next
  end

  def test_element_next_initialization
    element1 = Element.new(1)
    element2 = Element.new(2, element1)
    assert_equal element1, element2.next
  end

  def test_empty_list_size
    list = SimpleLinkedList.new
    assert_equal 0, list.size
  end

  def test_empty_list_empty
    list = SimpleLinkedList.new
    assert list.empty?
  end

  def test_pushing_element_on_list
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
  end

  def test_empty_list_1_element
    list = SimpleLinkedList.new
    list.push(1)
    refute list.empty?
  end

  def test_peeking_at_list
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_peeking_at_empty_list
    list = SimpleLinkedList.new
    assert_nil list.peek
  end

  def test_access_head_element
    list = SimpleLinkedList.new
    list.push(1)
    assert_instance_of Element, list.head
    assert_equal 1, list.head.datum
    assert list.head.tail?
  end

  def test_items_are_stacked
    list = SimpleLinkedList.new
    list.push(1)
    list.push(2)
    assert_equal 2, list.size
    assert_equal 2, list.head.datum
    assert_equal 1, list.head.next.datum
  end

  def test_push_10_items
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    assert_equal 10, list.size
    assert_equal 10, list.peek
  end

  def test_pop_1_item
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.pop
    assert_equal 0, list.size
  end

  def test_popping_frenzy
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    6.times { list.pop }
    assert_equal 4, list.size
    assert_equal 4, list.peek
  end

  def test_from_a_empty_array
    list = SimpleLinkedList.from_a([])
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_nil
    list = SimpleLinkedList.from_a(nil)
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_2_element_array
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal 2, list.size
    assert_equal 1, list.peek
    assert_equal 2, list.head.next.datum
  end

  def test_from_a_10_items
    list = SimpleLinkedList.from_a((1..10).to_a)
    assert_equal 10, list.size
    assert_equal 1, list.peek
    assert_equal 10, list.head.next.next.next.next.next.next.next.next.next.datum
  end

  def test_to_a_empty_list
    list = SimpleLinkedList.new
    assert_equal [], list.to_a
  end

  def test_to_a_of_1_element_list
    list = SimpleLinkedList.from_a([1])
    assert_equal [1], list.to_a
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_to_a_of_2_element_list
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal [1, 2], list.to_a
    assert_equal 2, list.size
    assert_equal 1, list.head.datum
    assert_equal 2, list.head.next.datum
  end

  def test_reverse_2_element_list
    list = SimpleLinkedList.from_a([1, 2])
    # list_r and list need not be the same object
    list_r = list.reverse

    assert_equal 2, list_r.peek
    assert_equal 1, list_r.head.next.datum
    assert list_r.head.next.tail?
  end

  def test_reverse_10_element_list
    data = (1..10).to_a
    list = SimpleLinkedList.from_a(data)
    assert_equal data.reverse, list.reverse.to_a
  end

  def test_roundtrip_10_element_array
    data = (1..10).to_a
    assert_equal data, SimpleLinkedList.from_a(data).to_a
  end
end











####
####




# class Element 
#   attr_accessor :value, :next

#   def initialize(value, next_value=nil)
#     @value = value
#     @next = next_value
#   end

#   def datum
#     @value
#   end

#   def tail?
#     true if @next.nil?
#   end
# end


# class SimpleLinkedList 
#   attr_accessor :head

#   def initialize
#     @head = nil
#   end 

#   def size 
#     count = 0 
#     current_element = head 

#     loop do 
#       count += 1 if !current_element.nil?
#       break if current_element.value.nil? || current_element.next == nil 
#       current_element = current_element.next
#     end 
    
#     count
#   end
  
#   def empty?
#     return true if @head == nil 
#     false 
#   end 

#   def push(data)
#     if head.nil? 
#       self.head = Element.new(data)
#       p head
#     else 
#       current_element = head
#       loop do 
#         if current_element.next.nil?
#           current_element.next = Element.new(data) 
#           p current_element
#           break
#         else
#          current_element = current_element.next
#         end
#       end 
#     end 
#   end

#   def peek
#     current_element = head 
#     loop do 
#       break if current_element.next == nil 
#       current_element = current_element.next
#     end 
#     current_element.value
#   end 

#   def pop
#   end

#   def from_a(arr)
#   end

# end
