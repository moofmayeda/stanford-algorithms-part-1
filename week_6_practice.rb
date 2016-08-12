def two_sum_long_way(filename)
  array = []
  File.open(filename).each do |line|
    array << line.to_i
  end
  array.sort!
  counter = 0
  (-10000..10000).each do |t|
    array.each do |x|
      if x != (t-x)
        counter += 1 if binary_search(array, t-x)
      end
    end
  end
end

def binary_search(array, number)
  length = array.length
  half = length/2
  if number == array[half]
    return true
  elsif length > 1
    if number > array[half]
      binary_search(array[half..length-1], number)
    else
      binary_search(array[0..half-1], number)
    end
  else
    return false
  end
end
two_sum_long_way('2sum.txt')
