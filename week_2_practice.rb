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

def partition(array, l, r)
  pivot_value = array[l]
  i = l + 1
  for j in (l+1)..r
    if array[j] < pivot_value
      array[i], array[j] = array[j], array[i]
      i += 1
    end
  end
  array[l], array[i-1] = array[i-1], array[l]
end

def choose_pivot(array, l, r)
  index = l + rand(r - l + 1)
  array[l], array[index] = array[index], array[l]
  array[l]
end

def quicksort(array, l, r)
  length = r - l + 1
  if length > 1
    pivot_value = choose_pivot(array, l, r)
    partition(array, l, r)
    pivot_index = array.index(pivot_value)
    quicksort(array, l, pivot_index - 1)
    quicksort(array, pivot_index + 1, r)
  else
    array
  end
end
quicksort([5,3,2,1,6,0], 0, 5)
