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

  # def to_s
  #   puts "# ---- #{title} ----"
  #   for todo in @todos 
  #     puts todo.to_s 
  #   end 
  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
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
    self.each do |todo|  # do/end is the block passed to the each method
      list.add(todo) if yield(todo) # yielding to block passed to the select method
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
    find_by_title(str) && find_by_title(str).done!
    #find_by_title(str).first.done!
    # takes a string as argument, and marks the first Todo object that matches the argument as done.
  end 
  
  def mark_all_done 	  
    self.each { |todo| todo.done!}
  end 

  def mark_all_undone  
    self.each { |todo| todo.undone!}
  end 

  def ==(other)
    title == other.title && self.to_a == other.to_a
  end
end