def merge_and_count_split_inversions(left, right)
  n = left[:array].count + right[:array].count
  i = 0
  j = 0
  counter = 0
  merged_array = []
  n.times do
    if left[:array][i].nil?
      merged_array << right[:array][j]
      j += 1
    elsif right[:array][j].nil?
      merged_array << left[:array][i]
      i += 1
    elsif left[:array][i] < right[:array][j]
      merged_array << left[:array][i]
      i += 1
    else
      merged_array << right[:array][j]
      counter += left[:array].count - i
      j += 1
    end
  end
  {array: merged_array, count: counter + left[:count] + right[:count]}
end

def sort_and_count(array)
  length = array.count
  if length > 1
    half = length / 2
    big_left = sort_and_count(array[0..half-1])
    big_right = sort_and_count(array[half..length-1])
    result = merge_and_count_split_inversions(big_left, big_right)
    result
  else
    {array: array, count: 0}
  end
end

# testing
sort_and_count([9, 12, 3, 1, 6, 8, 2, 5, 14, 13, 11, 7, 10, 4, 0]) # 56
sort_and_count([4, 80, 70, 23, 9, 60, 68, 27, 66, 78, 12, 40, 52, 53, 44, 8, 49, 28, 18, 46, 21, 39, 51, 7, 87, 99, 69, 62, 84, 6, 79, 67, 14, 98, 83, 0, 96, 5, 82, 10, 26, 48, 3, 2, 15, 92, 11, 55, 63, 97, 43, 45, 81, 42, 95, 20, 25, 74, 24, 72, 91, 35, 86, 19, 75, 58, 71, 47, 76, 59, 64, 93, 17, 50, 56, 94, 90, 89, 32, 37, 34, 65, 1, 73, 41, 36, 57, 77, 30, 22, 13, 29, 38, 16, 88, 61, 31, 85, 33, 54]) # 2372

# solving the problem
array = []
File.open('IntegerArray.txt').each do |line|
  array << line.to_i
end
sort_and_count(array) # 2407905288
