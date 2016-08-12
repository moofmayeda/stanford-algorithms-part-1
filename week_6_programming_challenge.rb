require 'set'
require 'algorithms'
include Containers

# 2 Sum Problem
set = Set.new
File.open('2sum.txt').each do |line|
  set.add line.to_i
end

counter = 0
(-10000..10000).each do |t|
  counter += 1 if set.any? { |x| set.include?(t-x) && x != (t-x)}
end

# Median Maintenance

heap_low = MaxHeap.new
heap_high = MinHeap.new

def median(i, heap_low, heap_high)
  if !heap_low.empty?
    if i <= heap_low.max
      heap_low << i
    else
      heap_high << i
    end
  else
    heap_low << i
  end
  if heap_low.size - heap_high.size > 1
    transfer = heap_low.max!
    heap_high << transfer
  elsif heap_high.size - heap_low.size > 1
    transfer = heap_high.min!
    heap_low << transfer
  end
  k = heap_low.size + heap_high.size
  if k.odd?
    heap_low.size > heap_high.size ? heap_low.max : heap_high.min
  else
    heap_low.max
  end
end

def get_running_median(filename)
  array = []
  File.open(filename).each do |line|
    array << line.to_i
  end
  heap_low = MaxHeap.new
  heap_high = MinHeap.new
  sum_of_medians = 0
  array.each do |i|
    sum_of_medians += median(i, heap_low, heap_high)
  end
  sum_of_medians%10000
end

get_running_median("median.txt")
# 1213
