class Stack
    def initialize(stack)
      # create ivar to store stack here!
      @stack = stack
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack = @stack.delete_at(-1)
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end