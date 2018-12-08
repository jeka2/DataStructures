require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
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
    if !root.left && !root.right 
      return
    end
    if root.left
      return find(root.left, data)
    end
    if root.right
      return find(root.right, data)
    end
  end

  def find_with_parent(parent, root, data)
    return if !data || !root
    if root && root.title == data
      return [parent, root]
    end
    if !root.left && !root.right 
      return
    end
    if root.left
      return find_with_parent(root, root.left, data)
    end
    if root.right
      return find_with_parent(root, root.right, data)
    end
  end

  def find_leftmost(node)
    while node.left 
      node = node.left
    end
    node
  end

  def find_rightmost(node)
    while node.right
      node = node.right
    end
    node
  end

  def replace(parent, node)
    if !node.left && !node.right
      if parent.rating > node.rating
        parent.left = nil
      else
        parent.right = nil
      end
    elsif node.right
      replacement = find_leftmost(node.right)
    elsif node.left 
      replacement = find_rightmost(node.left)
    end
    replacement.left = node.left ? node.left : nil
    replacement.right = node.right ? node.right : nil
    if node.rating > parent.rating
      parent.right = replacement
    else
      parent.left = replacement
    end
  end

  def delete(root, data)
    return if !root || !data
    node = find_with_parent(nil, root, data) ##node[0] == parent node[1] == child
    replace(node[0], node[1]) if node
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
