class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :visited

  def initialize(title, rating)
  	@title = title
  	@rating = rating
  	self.visited = false
  end
end