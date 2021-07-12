class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.map.with_index {|ele, i| (ele + i).hash}.sum
  end
end

#self.each_with_index.inject {|acc, ele, i| (acc ^ ele) }

# compare the elements using xor,
# could use acc ^ ele
# [[1, 0],[2, 1],[3, 2]]

class String
  def hash
    alpha = ("A".."z").to_a
    self.split("").map.with_index {|ch, i| (alpha.index(ch) + i).hash}.sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each {|k, v| sum += (k.hash + v.hash) }
    sum
  end
end
