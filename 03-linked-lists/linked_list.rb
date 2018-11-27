require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @list = []
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @list << node
    @tail = @list.last
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    @list.slice!(-1)
    @tail = @list.last
  end

  # This method prints out a representation of the list.
  def print
    "#{@list[0]}\n#{@list[1]}"
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    @list.delete(node)
    @head = @list.first
    @head.next = @list[1]
    @tail = @list.last
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @list.insert(0, node)
    @head = @list.first
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @list.slice!(0)
    @head = @list.first
  end
end