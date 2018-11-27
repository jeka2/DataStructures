require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @items = Array.new(size)
    @max_load_factor = 0.7
    @element_counter = 0
  end

  def []=(key, value)
    new_item = Node.new(key, value)
    new_index = index(key, @size)
    chainer(new_item, new_index, true)
  end

  def [](key)
    new_index = index(key, @size)
    @items[new_index].chain.each_with_index do |item, index|
      if item.key == key
        return @items[new_index].link(index).value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size = @size)
    holder = 0
    key.to_s.each_byte do |c|
      holder += c
    end
    holder % size
  end

  def chainer(node, index, new_value = false)
    @element_counter += 1 if new_value
    resize if load_factor >= @max_load_factor
    if @items[index] != nil
      @items[index].add_to_tail(node)
    else
      new_link = LinkedList.new
      new_link.add_to_tail(node)
      @items[index] = new_link
    end
  end

  # Calculate the current load factor
  def load_factor
    @element_counter * 1.0 / @size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    items_to_reindex = @items.compact
    @items = Array.new(@size)
    items_to_reindex.each do |bucket|
      bucket.chain.each { |b| chainer(b, index(b.key)) }
    end
  end

  def items
    @items
  end
end