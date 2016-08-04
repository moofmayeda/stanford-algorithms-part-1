total_lines = `wc -l "SCC.txt"`.strip.split(' ')[0].to_f

graph_array = []
File.open('SCC.txt').each do |line|
  graph_array << line.split(" ").map(&:to_i)
end
$n = graph_array.flatten.max
graph = {}
reversed_graph = {}
graph_array.each do |array|
  if graph[array[0]]
    graph[array[0]][:data] << array[1]
  else
    graph[array[0]] = {data: array[1,1], explored: false, leader: nil, finishing: nil}
  end
  if reversed_graph[array[1]]
    reversed_graph[array[1]][:data] << array[0]
  else
    reversed_graph[array[1]] = {data: array[0,1], explored: false, leader: nil, finishing: nil}
  end
end

def dfs_loop(graph)
  $t = 0
  $s = nil
  $new_order = $new_order || []
  if $new_order.empty?
    ($n).downto(1) do |i|
      explore_vertex(graph, i)
    end
  else
    $new_order.each do |i|
      explore_vertex(graph, i)
    end
  end
  counts_hash = Hash.new(0)
  graph.values.each{|obj| counts_hash[obj[:leader]] += 1}
  counts_hash.sort_by{|k,v| v}.reverse
end

def explore_vertex(graph, i)
  add_vertex(graph, i)
  if !graph[i][:explored]
    $s = i
    stack = [i]
    stack_index = 0
    while !stack[stack_index].nil?
      stack_length = stack.count
      start_vertex = stack[stack_index]
      add_vertex(graph, start_vertex)
      graph[start_vertex][:explored] = true
      graph[start_vertex][:leader] = $s
      graph[start_vertex][:data].each do |j|
        add_vertex(graph, j)
        stack.insert(stack_index + 1, j) if !graph[j][:explored]
      end
      if stack.count == stack_length
        $t += 1
        graph[start_vertex][:finishing] = $t
        $new_order.unshift(start_vertex)
      end
      stack_index += 1
    end
    stack.reverse.each do |vertex|
      if graph[vertex][:finishing].nil?
        $t += 1
        graph[vertex][:finishing] = $t
        $new_order.unshift(vertex)
      end
    end
  end
end

def add_vertex(graph, i)
  if graph[i].nil?
    graph[i] = {data: [], explored: false, leader: nil, finishing: nil}
  end
end

$new_order = nil
dfs_loop(reversed_graph)
dfs_loop(graph)
