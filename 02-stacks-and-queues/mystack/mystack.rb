class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = @stack.last
  end

  def pop
    item = @stack.slice!(-1)
    self.top = @stack.last
    item
  end

  def empty?
    if @stack.size == 0 
      true
    else
      false
    end
  end
end