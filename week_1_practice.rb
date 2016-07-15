def merge_sort(array)
  puts array.to_s
  length = array.count
  if length > 1
    half = length / 2
    left = merge_sort array[0..half-1]
    right = merge_sort array[half..length-1]
    merge(left, right)
  else
    array
  end
end

def merge(left, right)
  if left.empty?
    result = right
  elsif right.empty?
    result = left
  elsif left[0] < right[0]
    result = [left[0]] + merge(left[1..left.count-1], right)
  else
    result = [right[0]] + merge(left, right[1..right.count-1])
  end
  result
end

def add(big_array)
  k = big_array.count
  n = big_array[0].count
  merged = big_array[0]
  (k - 1).times do |i|
    merged = merge(merged, big_array[i+1])
  end
  merged
end
