class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    @queue.slice!(0, 1)
    @head = @queue[0]
    @tail = @queue.last
  end

  def empty?
    if @queue.size > 0
      false
    else 
      true
    end
  end
end