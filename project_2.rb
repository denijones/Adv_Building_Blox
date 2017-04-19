module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end


  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i],i)
      i += 1
    end
    self
  end

  def my_select
    y = Array.new
    self.my_each do |x|
      if (yield(x)) == true
        y << x
      end
    end
    y
  end

  def my_all?
    self.my_each do |x|
      if block_given? == false
        if x == false || x == nil
          return false
        end
      elsif (yield(x)) == false
        return false
      end
    end
    true
  end

  def my_any?
    self.my_each do |x|
      if block_given? == false
        if x == true
          return true
        end
      elsif (yield(x)) == true
        return true
      end
    end
    false
  end

  def my_none?
    self.my_each do |x|
      if block_given? == false
        if x == true
          return false
        end
      elsif (yield(x)) == true
        return false
      end
    end
    true
  end

  def my_count(number = nil)
    count = 0
    self.to_a.my_each do |x|
      if block_given?
        if (yield(x)) == true
          count += 1
        end
      elsif number != nil
          return number
      else
        count += 1
      end
    end
    count
  end

  def my_map(has_proc = nil)
    y = Array.new
    self.to_a.my_each do |x|
      if has_proc != nil
        has_proc.call(x)
      elsif block_given? == false
        y << x
      else
        y << yield(x)
      end
    end
    y
  end

  def my_inject(hold = 0)
    array = self.to_a
    if array[0].is_a? String
      hold = ""
    end
    array.my_each do |x|
      hold = yield(hold, x)
    end
    hold
  end
end

def multiply_els(numbers)
  numbers.my_inject(1) {|x,y| x * y}
end
