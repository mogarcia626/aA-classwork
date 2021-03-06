class MaxIntSet

  attr_reader :store
  
  def initialize(max)
    @max = max
    @store = Array.new(max,false) 
  end

  def insert(num)   
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true   
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
    @count = 0
  end

  def insert(num)
    resize! if @count >= @num_buckets
    unless self[num].include?(num)
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end


  private
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    temp_new = Array.new(@num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each { |ele| temp_new[ele % @num_buckets] << ele }
    end
    @store = temp_new
  end
end
