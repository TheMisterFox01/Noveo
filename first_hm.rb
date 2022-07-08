def sum_arr(arr)
  if arr.size == 1
    return arr[0]
  end
  arr.shift + sum_arr(arr)
end

puts sum_arr([1,2,3,4,5,6,-1,1666,3.34])  
