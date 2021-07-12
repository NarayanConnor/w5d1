require "byebug"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # debugger
    self[key.hash] << key if !include?(key)
    @count += 1
    resize! if @count == @store.length
  end


  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self[key.hash].include?(key) 
      ki=self[key.hash].index(key)
      self[key.hash].delete_at(ki)
      @count-=1
    end
  end

  private

  def [](num)
    # debugger
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store +=  Array.new(@store.length) { Array.new } 
  end
end
