require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      current_node = @head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = node
      @tail = node
    else
      @head, @tail = node, node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    return unless @head && @tail
    current_node = @head
    found = false
    while !found
      if current_node.next
        unless current_node.next.next
          @tail = current_node
          @tail.next = nil
          found = true
        else
          current_node = current_node.next
        end
      else
        found = true
        @head, @tail = nil, nil
      end
    end
  end

  # This method prints out a representation of the list.
  def print
    return if !@head
    current_node = @head
    list_finished = false
    while !list_finished
      print "#{current_node.data}"
      if current_node.next
        current_node = current_node.next
      else
        list_finished = true
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    return remove_front if node.data = @head.data
    return remove_tail if node.data = @tail.data
    current_node = @head
    found = false
    while !found
      if current_node.next.data == node.data
        found = true
        current_node.next = current_node.next.next
      elsif current_node.next && current_node.next.data != node.data
        current_node = current_node.next
      elsif !current_node.next
        return 
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if !@head
      @head = node
      return
    end
    temp_node = @head
    temp_node.next = @head
    temp_node.data = node.data
    @head = temp_node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    return if !@head
    @head = @head.next
  end
end

