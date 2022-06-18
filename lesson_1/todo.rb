# class Todo
#   DONE_MARKER = 'X'
#   UNDONE_MARKER = ' '

#   attr_accessor :title, :description, :done

#   def initialize(title, description='')
#     @title = title
#     @description = description
#     @done = false
#   end

#   def done!
#     self.done = true
#   end

#   def done?
#     done
#   end

#   def undone!
#     self.done = false
#   end

#   def to_s
#     "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
#   end

#   def ==(otherTodo)
#     title == otherTodo.title &&
#       description == otherTodo.description &&
#       done == otherTodo.done
#   end
# end

# class TodoList
#   attr_accessor :title

#   def initialize(title)
#     @title = title
#     @todos = []
#   end

#   def size 
#     @todos.size
#   end 

#   def first 
#     @todos[0].title
#   end 

#   def last 
#     @todos[-1].title
#   end 

#   def shift 
#     @todos.delete_at(0)
#   end 

#   def pop 
#     @todos.delete_at(-1)
#   end 

#   def add(todo)     
#     if todo.class == Todo 
#       @todos << todo 
#     else 
#       raise TypeError.new("Can only add Todo objects!")
#     end
#   end  
#   alias_method :<<, :add 

  # LS Implementation 
  # def <<(todo)
  #   raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

  #   @todos << todo
  # end
  # alias_method :add, :<<

  # def to_a
  #   @todos.clone
  # end 

  # def done?
  #   @todos.all? { |todo| todo.done? }
  # end 

  # def item_at(idx)
  #   @todos.fetch(idx)
  # end

  # def mark_done_at(idx)
  #   item_at(idx).done!
  # end

  # def mark_undone_at(idx)
  #   item_at(idx).undone!
  # end

  # def done!
  #   @todos.each_index do |idx|
  #     mark_done_at(idx)
  #   end
  # end

  # def remove_at(idx)
  #   @todos.delete_at(idx) if item_at(idx)
  # end 

  # def to_s
  #   puts "# ---- #{title} ----"
  #   for todo in @todos 
  #     puts todo.to_s 
  #   end 
  # end
  
  # LS Implementation
#   def to_s
#     text = "---- #{title} ----\n"
#     text << @todos.map(&:to_s).join("\n")
#     text
#   end
# end 

  # # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError


# given
# todo1 = Todo.new("Study RB130")
# todo2 = Todo.new("Record vocals")
# todo3 = Todo.new("Take Wiley to the park")
# todo1.done!
# list = TodoList.new("Jesse's Sat Todo List")

# ---- Adding to the list -----

# add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# todo1.done!
# todo2.done!
# todo3.done!
# list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done
# list.done?

# # ---- Deleting from the list -----

# # shift
# list.shift                      # removes and returns the first item in list
# list.size 

# # pop
# list.pop                        # removes and returns the last item in list
# list.size 

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# list.done!
# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym




#####################
#####################
#####################
#####################
#####################
#####################
#####################




class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size 
    @todos.size
  end 

  def first 
    @todos[0]
  end 

  def last 
    @todos[-1]
  end 

  def shift 
    @todos.delete_at(0)
  end 

  def pop 
    @todos.delete_at(-1)
  end 

  def add(todo)     
    if todo.class == Todo 
      @todos << todo 
    else 
      raise TypeError.new("Can only add Todo objects!")
    end
  end  
  alias_method :<<, :add 

  def to_a
    @todos.clone
  end 

  def done?
    @todos.all? { |todo| todo.done? }
  end 

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete_at(idx) if item_at(idx)
  end 

  def to_s
    puts "# ---- #{title} ----"
    for todo in @todos 
      puts todo.to_s 
    end 
  end

  def each
    counter = 0 
    while counter < @todos.size 
      yield(@todos[counter])
      counter += 1
    end 
    self
  end

  # When TodoList#each is called inside of the TodoList#select method, each todo object is yielded to the block passed to the
  # the each method within the select method, which is then yielded to the block passed to the select method by the method caller at invocation time 
  
  def select
    list = TodoList.new(title) # using getter title method to title our new list
    self.each do |todo| 
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(str)
   self.select { |todo| todo.title == str }.first
   # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
  end

  def all_done
    self.select { |todo| todo.done? }        
    # returns new TodoList object containing only the done items
  end

  def all_not_done 	  
    self.select { |todo| !todo.done? }     
    # returns new TodoList object containing only the not done items
  end 

  def mark_done(str)
    find_by_title(title) && find_by_title(title).done!
    #find_by_title(str).first.done!
    # takes a string as argument, and marks the first Todo object that matches the argument as done.
  end 

  def mark_all_done 	  
    self.each { |todo| todo.done!}
  end 

  def mark_all_undone  
    self.each { |todo| todo.undone!}
  end 
end

# Given our final Todo and TodoList classes from the previous assignment, 
# implement a TodoList#each method. This method should behave similarly to the familiar Array#each, 
# and the each method we built ourselves in an earlier example. 
# The TodoList#each should take a block, and yield each Todo object to the block. 
# Here's an example of how to use it:


todo1 = Todo.new("Study RB130")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Study RB130")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

#each method check 

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

#select method check

# todo2.done!
# todo2.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method
# puts results.inspect


# p list.find_by_title("Study RB130")
# p list.all_done
# p list.all_not_done
# p list.mark_done("Study RB130")
# p list.all_done
# list.mark_all_done
# p list.all_done
