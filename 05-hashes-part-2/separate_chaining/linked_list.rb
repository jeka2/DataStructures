require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize 
    @chain = []
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @chain << node
    @tail = @chain.last
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    @chain.pop
    @tail = @chain.last
  end

  # This method prints out a representation of the list.
  def print
    @chain
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    @chain.delete(node)
    @head = @chain[0]
    @tail = @chain[-1]
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @chain.insert(0, node)
    @head = @chain[0]
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    first = @chain.shift
    @head = chain[0]
    first
  end

  def chain
    @chain
  end

  def link(index)
    @chain[index]
  end
end