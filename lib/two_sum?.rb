def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, idx1|
    idx2 = idx1 + 1
    while idx2 < arr.length
      return true if el1 + arr[idx2] == target_sum
      idx2 += 1
    end
  end
  false
end

#Time complexity is O(n^2)

arr = [0, 1, 5, 7]

def bsearch(nums, target)
  return nil if nums.count == 0
  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
  end
end

def okay_two_sum?(nums, target)
  nums.each do |num|
    copy = nums.dup
    copy.delete(num)
    return true unless bsearch(copy, (target - num)).nil?
  end

  false
end

def best_two_sum?(nums, target)
  h = Hash.new(0)
  nums.each do |num|
    h[num] += 1
  end
  nums.each do |num|
    difference = target - num
    if difference == num
      return true if h[difference] > 1
    else
      return true if h[difference] > 0
    end
  end
  false
end

p best_two_sum?(arr, 6)
p best_two_sum?(arr, 10) # => should be false
