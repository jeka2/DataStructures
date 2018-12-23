require_relative 'node'
class MinHeap
  
  def initialize(root) 
  	@root = root
  	@queue = []
  	@switch_queue = []
  end

  def insert(root, node, index = nil, index_end = nil, end_of_search = false) 
  	if node.rating < root.rating && @queue == [] ##IF IN THE VERY FIRST INSERT THE NODE'S RATING IS LOWER THAN THE ROOT'S RATING
  		switch(root, node) 
  		return
  	elsif !root.left && node.rating > root.rating
	  	root.left = node
	  	return
  	elsif !root.right && node.rating > root.rating
	  	root.right = node
	  	return
	  elsif root.left && root.right
	 	  @queue << root.left
	 	  @queue << root.right
		  @queue[index] = nil if index
	  elsif root.left
		  @queue << root.left
	  elsif root.right
		  @queue << root.right
		  @queue[index] = nil if index
	  else
		 end_of_seach = true
	  end
	 return switch(@root, node) if end_of_seach && index == index_end ## IF THE NODE ELEMENT IS SMALLER THAN ANY OF THE LEAFS, THE NODE IS SENT TO THE TOP OF THE TREE TO FIND A PLACEMENT
	 if @queue != [] && index == index_end
		  @queue.compact
		  index_end = @queue.length - 1
		  @queue.each_with_index do |root, i|
			   insert(root, node, i, index_end)
	    end
	end
  end

  def switch(root, node, index = nil, index_end = nil, parent = nil, designation = nil)
    p '1'
    p root
    p node
  		if node.rating < root.rating ##NARROWING DOWN ON THE REPLACEMENT
        p '2'
  			node.right = root.right
  			if root.left && root.left.right
  				temp = root.left.right
  				root.left.right = nil
  				@queue.insert(0, temp) ##SINCE 2 NODES WERE DISPLACED, THEY ARE NOW IN THE FOREFRONT OF THE QUEUE
  				@queue.insert(0, root.left) ##DEFAULT INSERT NEEDED!
  			else
          p '3'
  				temp = nil
  			end
  			root.right = temp
  			node.left = root
        p '4'
        p root
        p node
  			if parent ##THIS DE-ATTACHES THE PARENT NODE FROM THE OLD CHILD AND ATTACHES TO THE NEW CHILD SO AS TO MAINTAIN INTEGRITY
          p '5'
  				if designation === 'l'
  					parent.left = node
  				elsif designation === 'r'
  					parent.right = node
  				end
  			else
          p '6'
  				@root = node ##. IF THE NODE WAS SMALLER THAN THE VERY TOP ROOT OF THE TREE, IT WILL BECOME THE NEW @root
          p @root
          p '7'
          p @root.left
  			end
  		else ##THE NODE WAS BIGGER THAN THE ROOT, SO IT NEEDS TO BE SENT DOWN THE TREE(USING A QUEUE) UNTIL A SWITCH OPPORTUNITY IS FOUND
  			@switch_queue << [root.left, root, 'l'] if root.left
  			@switch_queue << [root.right, root, 'r'] if root.right
  			@switch_queue.slice!(index) if index
  			if index == nil || index == index_end
  				index_end = @switch_queue.length - 1
		  		@switch_queue.each_with_index do |q, i|
		  			switch(q[0], node, i, index_end, q[1], q[2])
		  		end
  			end
  		end
  end

  def queue
    @root
  end
end






