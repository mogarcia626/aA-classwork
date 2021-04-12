class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    answer = ""
    self.each_with_index do |ele, idx|
      answer += (ele*5).to_s if idx.even?
      answer += (idx**2).to_s if ele.even?
      answer += (ele**2).to_s if idx.odd?
      answer += (idx*5).to_s if ele.odd?
    end
     answer.to_i
  end
 
end

p [1,2,3].hash

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
