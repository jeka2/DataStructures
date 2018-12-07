require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @stack = []
  end

  
def insert(root, node)
  if root.rating < node.rating && !root.right
    root.right = node
  elsif root.rating < node.rating && root.right
    insert(root.right, node)
  elsif root.rating > node.rating && !root.left
    root.left = node
  elsif root.rating > node.rating && root.left
    insert(root.left, node)
  end
end

  # Recursive Depth First Search
  def find(root, data)
    return if !data || !root
    if root && root.title == data
      return root
    end
    if root.left
      return find(root.left, data)
    end
    if root.right
      return find(root.right, data)
    end
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children = nil)
    queue = []
    if children == nil
      root_node = [@root]
      print "#{root_node.first.title}: #{root_node.first.rating}\n"
      if root_node.first.left
        queue << root_node.first.left
      end
      if root_node.first.right
        queue << root_node.first.right
      end
      printf(queue)
    else
      children.each do |item|
        print "#{item.title}: #{item.rating}\n"
        if item.left
          queue << item.left
        end
        if item.right
          queue << item.right
        end
      end
      return if queue.length == 0
      printf(queue)
    end
  end
end
