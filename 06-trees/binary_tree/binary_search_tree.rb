require_relative 'node'
include 'binary_search_tree_helper'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating <= root.rating 
      @root = leftify(@root, node)
    else
      @root = rightify(@root, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
