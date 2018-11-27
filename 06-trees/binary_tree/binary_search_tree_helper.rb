module BinarySearchTreeHelper
	def leftify(root, node)
		root.left = node
	end

	def rightify(root, node)
		root.right = node
	end
end