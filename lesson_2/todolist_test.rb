require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Study RB130")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Tests go here. They must start with "test_"

  def test_to_a 
    assert_equal(@todos, @list.to_a)
  end

  def test_size 
    assert_equal(3, @list.size)
  end 

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done? 
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add("Practice Guitar") }
    assert_raises(TypeError) { @list.add(5) }
  end

  def test_shovel_alias
    new_todo = Todo.new("New Todo")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end  

  def test_add
    new_todo = Todo.new("New Todo")
    @todos << new_todo
    @list.add(new_todo)

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at 
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(10) }
  end

  def test_mark_done_at
    assert_equal(true, @list.mark_done_at(0))
    assert_equal(false, @todo2.done?)
    assert_equal(true, @list.mark_done_at(2))
    assert_raises(IndexError) { @list.mark_done_at(10) }
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(false, @list.mark_undone_at(0))
    assert_equal(true, @todo2.done?)
    assert_equal(false, @list.mark_undone_at(2))
    assert_raises(IndexError) { @list.mark_undone_at(10) }
  end
  
  def test_mark_done 
    @list.mark_done(@todo3.title)
    assert_equal(true, @list.last.done?)
  end 

  # def mark_done(str)
  #   find_by_title(str) && find_by_title(str).done!
  #   #find_by_title(str).first.done!
  #   # takes a string as argument, and marks the first Todo object that matches the argument as done.
  # end 

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at 
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(10) }
    # if item is at certain index, delete that item (and return it) 
  end 

  def test_to_s    
    expected_result = <<-HEREDOC.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Study RB130
    [ ] Clean room
    [ ] Go to gym
    HEREDOC

    assert_equal(expected_result, @list.to_s)
  end

  def test_to_s2
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Study RB130
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s3
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Study RB130
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = [] 
    @list.each { |todo| result << todo}
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each2
    result = @list.each { |_| "test"} 
    assert_equal(@list, result)
  end

  def test_select
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo1 

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list, @list.select{ |todo| todo.done? })
  end 

  def test_select_2
    result = @list.select { |todo| nil }.to_a
    assert_equal([], result)
  end 
end


# Writting tests for our ToDooList Program

# In the practice problems below, some of the problems will only list the method name. 
# You are to write a test to verify the behavior of this method. 
# If you need to look at the solution, feel free to do so. Play around with it, 
#   and add an additional assertion if you wish. Look back at the list of assertions available to you. 
#   Hint: you should be able to use assert_equal for the most part.