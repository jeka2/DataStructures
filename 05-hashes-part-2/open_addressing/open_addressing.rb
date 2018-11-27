require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    new_item = Node.new(key, value)
    new_index = index(key, @size)
    if @items[new_index] != nil
      @items[new_index].next = next_open_index(index(key, @size))
      new_index = next_open_index(index(key, @size))
      @items[new_index] = new_item
    else 
      @items[new_index] = new_item
    end
  end

  def [](key)
    new_index = index(key, @size)
    if @items[new_index].next 
      new_index = key_index_validator(new_index, key)
      @items[new_index].value
    else
      @items[new_index].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string
  # a starting point.
  def index(key, size)
    holder = 0
    key.to_s.each_byte do |c|
      holder += c
    end
    holder % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
      (index + 1).upto(@items.length - 1) do |indx|
        if @items[indx] == nil
          return indx
        end
      end
      0.upto(index - 1) do |indx|
        if @items[indx] == nil
          return indx
        end
      end
      resize
      return -1
  end

  def key_index_validator(index, key)
    if @items[@items[index].next].key == key 
      return @items[index].next.to_i
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  def items
    @items
  end

  # Resize the hash
  def resize
    @size = @size * 2
    items_to_reindex = @items.compact
    @items = Array.new(@size)
    resize_indexer(items_to_reindex)
  end

  def resize_indexer(items_to_reindex)
    items_to_reindex.each do |item|
      new_index = index(item.key, @size)
      @items[new_index] = item
    end
  end
end