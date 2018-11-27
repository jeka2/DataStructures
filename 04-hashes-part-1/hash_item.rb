class HashItem
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
    HashItem.all << self
  end

  def self.all 
    @all ||= []
  end

  def self.each(&proc)
    @all.each(&proc)
  end
  
end