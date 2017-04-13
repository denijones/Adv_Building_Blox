def bubble_sort(numbers)
  # after each iteration, the rightmost number is in its final spot, no need to compare it again
  count = -2
  #continue to loop until no swapping has occured
  loop do
    swapped = false
    #check each index within set range, then update the array accordingly
    numbers[0..count].each_with_index.map do |number, index|
      #compare the numbers
     if numbers[index] > numbers[index+1]
       #swap the numbers
        numbers[index], numbers[index+1] =  numbers[index + 1], numbers[index]
        #note a swap occurred
        swapped = true
      end
    end
    #don't count the last number from this iteration
    count -= 1
    # stop looping, no swaps occurred
    break if swapped == false
  end
  #print the array but make make it more readable
  puts numbers.inspect
end

#same as above method but instead yields to a block to compare length
def bubble_sort_by(words)
  loop do
    swapped = false
    words[0..-2].each_with_index.map do |word, index|
      result = yield words[index], words[index+1]
      if result > 0
        words[index], words[index+1] = words[index+1], words[index]
        swapped = true
      end
    end
    break if swapped == false
  end
  puts words.inspect
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

bubble_sort([4,3,78,2,0,2])
