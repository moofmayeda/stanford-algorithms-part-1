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

# randomly choose pivot
def choose_pivot(array, l, r)
  index = l + rand(r - l + 1)
  array[l]
end

def r_select(array, i, l, r)
  length = r - l + 1
  if length > 1
    pivot_value = choose_pivot(array, l, r)
    pivot_index = array.index(pivot_value)
    array[l], array[pivot_index] = array[pivot_index], array[l]
    partition(array, l, r)
    pivot_index = array.index(pivot_value)
    if pivot_index + 1 == i
      pivot_value
    elsif pivot_index + 1 < i
      r_select(array, i - pivot_index, pivot_index + 1, r)
    elsif pivot_index + 1 > i
      r_select(array, i, l, pivot_index - 1)
    end
  else
    array[l]
  end
end
r_select([5,3,2,1,6,0],3,0, 5) # 2

# deterministic choose_pivot
def choose_pivot(array, l, r)
  middle_elements = []
  array[l..r].each_slice(5) do |slice|
    slice.sort!
    if slice.length.even?
      middle_elements << slice[slice.length / 2 - 1]
    else
      middle_elements << slice[slice.length / 2]
    end
  end
  i = middle_elements.length.even? ? middle_elements.length / 2 : middle_elements.length / 2 + 1
  r_select(middle_elements, i, 0, middle_elements.length - 1)
end
