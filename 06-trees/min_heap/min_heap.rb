require_relative 'node'
class MinHeap
  
  def initialize(root) 
  	@root = root
  	@queue = []
  end

  def insert(root, node, done_with_node = false) 
  	@queue.slice(0) if done_with_node
  	@queue << root.left if root.left
  	@queue << root.right if root.right
  	if node.rating < root.rating
  		unless @queue = []
  			insert(root, node, true)
  		else
  			swap(node)
  		end
  	elsif node.rating > root.rating && !root.left						   
  		root.left = node
  	elsif node.rating > root.rating && !root.right
  		root.right = node 
  	elsif @queue = []
  		insert(@root, node, false, true)
    else
    	insert(@queue[0], node, true)
    end
  end

  def swap(node)
  	if @root.rating < node.rating
  		temp = @root
  		@root = node
  		node.right = temp
  	end
  end

  def special_case(root, node)

  end
 
end










=begin def build_max_heap(arr)

  def insert(root, node, done_with_node = false)
  	@queue.slice(0) if done_with_node
  	@queue << root.left if root.left
  	@queue << root.right if root.right
	if !root.left
	 	root.left = node
	elsif !root.right
	  		root.right = node
	else
	  		insert(@queue[0], node, true)
	end
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
=end