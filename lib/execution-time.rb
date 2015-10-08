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

# Time complexity O(n)
