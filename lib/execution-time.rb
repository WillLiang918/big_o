def my_min_p1(array)
  smallest = array.first


  array.length.times do |starting_idx|
    next_number = starting_idx + 1
    while next_number < array.length
      if array[next_number] < smallest
        smallest = array[next_number]
      end
      next_number += 1
    end
#    (array.length).times do |index2|
      # array.drop(idx1 + 1)
  end
  smallest

end

def my_min_p2(array)
  smallest = array.first
  array.each { |number| smallest = number if number < smallest }
  smallest
end

def largest_contiguous_subsum_p1(list)
   sub_arrays = []

   list.each_index do |idx1|
     list.drop(idx1).each_index do |idx2|
       sub_arrays << list[idx1..idx1+idx2]
     end
   end

   sum_of_sub_array = []

   sub_arrays.each do |subset|
     sum_of_sub_array << subset.inject { |a, x| a + x }
   end

   sum_of_sub_array.max
 end

 def largest_contiguous_subsum_p2(list)
  current_subsum = 0
  greatest_subsum = 0
  i = 0
  while i < list.length
    current_subsum += list[i]
    if greatest_subsum < current_subsum
      greatest_subsum = current_subsum
    else
      current_subsum = 0
    end
    i += 1
  end
  greatest_subsum
 end

p largest_contiguous_subsum_p2([3,-7,5,4])

# Time complexity O(n)
