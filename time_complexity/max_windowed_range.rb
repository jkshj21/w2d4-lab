
def windowed_max_range_naive(arr, window_size) #n^2 log(n)which is pretty bad!!
  max_range = 0
  arr.each_cons(window_size) do |sub_arr| #n
    sorted = sub_arr.sort #nlog(n)
    diff = sorted.last - sorted.first
    max_range = diff if diff > max_range
  end
  max_range
end

def windowed_max_range_optimized(arr, window_size)

end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop
  end

  def count
    @store.count
  end
end

class MyStackQueue
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end

  def enqueue(element)
    @store1.push(element)
  end

  def dequeue
    if @store2.count == 0
      until @store1.count == 0
        @store2.push(@store1.pop)
      end
    end

    @store2.pop
  end
end

class MyMaxStack
  def initialize
    @store = []
    @data = Array.new
  end

  def push(element)
    if @store.empty?
      @store << element
      @data << {min=> element, max=> element}
    else
      hash = {}
      @store << element

      if element > @data.last[max]
        hash[max] = element
      else
        hash[max] = @data.last[max]
      end
      #----------------------------

      if element < @data.last[min]
        hash[min] = element
      else
        hash[min] = @data.last[min]
      end

      @data << hash
    end
  end

  def pop
    @store.pop
    @data.pop
  end

  def count
    @store.count
  end

  def max
    @data.last[max]
  end

  def min
    @data.last[min]
  end
end


class MyStackQueue
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end

  def enqueue(element)
    @store1.push(element)
  end

  def dequeue
    if @store2.count == 0
      until @store1.count == 0
        @store2.push(@store1.pop)
      end
    end

    @store2.pop
  end
end

class MyMaxMinStackQueue
  def initialize
    @store = Array.new
  end
  def enqueue(element)
    hash = {:value => element, :min => element, :max => element }
    if @store.empty?
      @store << hash
    else
      if @store.first[max] > element
        hash[max] = @store.first[max]
      end

      if @store.first[min] < element
        hash[min] = @store.first[min]
      end
      @store << hash
    end
  end
  
  def pop
    @store.pop
    @data.pop
  end

  def count
    @store.count
  end

  def max
    @data.last[max]
  end

  def min
    @data.last[min]
  end
end
