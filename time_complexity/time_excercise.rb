def my_min_phase_one(list) #bubble sort takes (n^2) time
  i = list.length - 1
  until i <= 0
    j = 0
    until j >= i
      unless list[j+1].nil?
      list[j], list[j+1] = list[j+1], list[j] if list[j] > list[j+1]
      end
      j+=1
    end
    i-=1
  end
  list.first
end

def my_min_phase_two(list) # Doesnt sort the given array however it finds the minimum element
  ans = list.first
  list.each_with_index do |num, i|
    ans = num if ans > num
  end
  ans
end

def largest_contiguous_subsum_phase_one(list) # running time is approximately n^3

  greatest_sum = 0

  2.upto(list.length) do |subarr_length|
    list.each_cons(subarr_length) do |sub_arr|
      sum = sub_arr.reduce(:+)
      greatest_sum = sum if greatest_sum < sum
    end
  end
  greatest_sum
end

def largest_contiguous_subsum_phase_two(list) # running time is approximately n
  greatest_sum = list.first
  curr_sum = 0

  list.each_with_index do |num,i|
    curr_sum+= num
    if curr_sum > greatest_sum
      greatest_sum = curr_sum
    end
    if curr_sum < 0
      curr_sum = 0
    end

  end
  greatest_sum
end
