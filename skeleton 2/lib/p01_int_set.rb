class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store.each do |bucket|
      if bucket.empty?
        bucket<<num 
        return true 
      end
    end
    false
  end

  def remove(num)
    @store.each do |bucket|
      if bucket.include?(num) 
        bucket.shift
      end

    end
  end

  def include?(num)
    @store.include?([num])
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

require "byebug"

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    return if include?(num)
    # debugger
    @store.each do |bucket|
      # debugger
      if bucket.empty?
        bucket << num 
        @count += 1
        # debugger
        break
      end
    end
  end

  def remove(num)
    @store.each do |bucket|
      if bucket.include?(num) 
        bucket.shift
      end

    end
  end

  def include?(num)
    @store.include?([num])
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
