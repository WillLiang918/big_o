def first_anagram?(word1, word2)
  anagrams(word1).include?(word2)
end

def anagrams(word)
  return [word] if word.length == 1
  possible_anagrams = []

  permutations = anagrams(word[1..-1])

  permutations.each do |anagram|
    (anagram.length + 1).times do |idx|
      some_var = anagram.dup.insert(idx, word[0])
      possible_anagrams << some_var
    end
  end
  possible_anagrams
end

def second_anagram?(word1, word2)
  word2.chars.each do |chr|
     if word1.chars.include?(chr)
       word1.sub!(chr,'')
     else
       return false
     end
  end
  word1.empty?
end

def third_anagram?(word1, word2)
  merge_sort(word1.chars) == merge_sort(word2.chars)
end

def merge_sort(word)
  return word if word.length <= 1
  mid = word.length/2
  left = merge_sort(word.take(mid))
  right = merge_sort(word.drop(mid))
  merge(left, right)
end

def merge(left, right)
  sorted_array = []
  until (left.empty? || right.empty?)
    if (left.first <=> right.first) == -1
      sorted_array << left.shift
    else
      sorted_array << right.shift
    end
  end
  sorted_array + left + right
end

def fourth_anagram?(word1, word2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  word1.chars.each { |char| h1[char] += 1 }
  word2.chars.each { |char| h2[char] += 1 }

  h1.each do |key, value|
    return false unless h2[key] - value == 0
  end

  true
end

p first_anagram?("elvis", "lives") == true
p first_anagram?("elvis", "lived") == false
p second_anagram?("elvis", "lives") == true
p second_anagram?("elvis", "lived") == false
p third_anagram?("elvis", "lives") == true
p third_anagram?("elvis", "lived") == false
p fourth_anagram?("elvis", "lives") == true
p fourth_anagram?("elvis", "lived") == false
