class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    HashItem.new(key, value)
    new_index = index(key, @size)
    if(@items[new_index] == nil)
      @items[new_index] = value
    else
      resize
    end
  end

  def [](key)
    new_index = index(key, @size)
    @items[new_index]
  end

  def resize
   @size = @size * 2
   @items = Array.new(@size)
   resize_indexer
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def resize_indexer
    HashItem.each do |item|
      new_index = index(item.key, @size)
      if(@items[new_index] == nil)
        @items[new_index] = item.value
      else
        resize 
      end
    end
  end

  def index(key, size)
    holder = 0
    key.to_s.each_byte do |c|
      holder += c
    end
    new_index = holder % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  end
  

end