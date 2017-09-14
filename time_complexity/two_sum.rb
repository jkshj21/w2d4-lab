require "byebug"

def brute_force(arr, target)# run time of O(n^2)
  arr.each_with_index do |e, i|
    arr.each_with_index do |e2, j|
        sum = e+e2
        if sum == target && i != j
          return true
        end
    end
  end
  false
end

#-------------------------------------------#

def sorting(arr, target) #nlogn

  arr.each_with_index do |e,i|
    next if i == arr.count - 1
    difference = target - e
    return true if binary_search(arr.drop(i+1), difference)
    # debugger
  end
  false
end

def binary_search(arr, target)#logn (helpful method)
  midpoint = arr.length / 2
  return true if arr[midpoint] == target
  return false if arr.count <= 1
  if target > arr[midpoint]
    arr = arr.drop(midpoint)
  else
    arr = arr.take(midpoint)
  end
  binary_search(arr, target)
end

#--------------------------------------#

def hash_map(arr, target ) #O(n)
  # hash = Hash.new(0) #set the default as nil
  # arr.each do |el| #O(n)
  #   hash[el] += 1
  # end
  #
  # arr.each do |el|
  #   difference = target - el
  #   if target / 2 == el && target.even? # Checks whether we are checking same element
  #     return true if hash[difference] > 1 # make sure more than one copy of same element
  #   else
  #     return true if hash[difference] > 0
  #   end
  # end
  # false

  hash = Hash.new

  arr.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end

  false
end
