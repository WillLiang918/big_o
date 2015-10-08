def windowed_max_range(arr, w)
  current_max_range = 0
  idx = 0

  while idx + w <= arr.length

    current_subset = arr[idx...idx+w]
    local_max = current_subset[0]
    local_min = current_subset[0]

    current_subset.each do |el|
      if el < local_min
        local_min = el
      elsif el > local_max
        local_max = el
      end
    end

    local_max_range = local_max - local_min

    if current_max_range < local_max_range
      current_max_range = local_max_range
    end

    idx += 1
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def windowed_max_range(arr, w)
  current_max_range = 0
  idx = 0

  arr.each_index do |i|
     current_subset = arr[i...i+w]
     local_max = current_subset.max
     local_min = current_subset.min

     local_max_range = local_max - local_min

     if current_max_range < local_max_range
       current_max_range = local_max_range
     end
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
