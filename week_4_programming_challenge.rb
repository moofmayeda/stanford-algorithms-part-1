total_lines = `wc -l "example.txt"`.strip.split(' ')[0].to_f

graph_array = []
File.open('example.txt').each do |line|
  graph_array << line.split(" ").map(&:to_i)
  puts "#{$.}/#{total_lines} (#{$./total_lines * 100}%"
end
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
    (graph.count).downto(1) do |i|
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

# turned into a while loop
# def dfs(graph, start_vertex)
#   graph[start_vertex][:explored] = true
#   graph[start_vertex][:leader] = $s
#   graph[start_vertex][:data].each do |j|
#     add_vertex(graph, j)
#     dfs(graph, j) if !graph[j][:explored]
#   end
#   $t += 1
#   graph[start_vertex][:finishing] = $t
#   $new_order.unshift(start_vertex)
# end

def explore_vertex(graph, i)
  add_vertex(graph, i)
  if !graph[i][:explored]
    puts "*" * 50
    puts "vertex #{i} is about to be explored"
    $s = i
    # dfs(graph, i)
    stack = [i]
    stack_index = 0
    while !stack[stack_index].nil?
      start_vertex = stack[stack_index]
      # insert dfs functionality
      add_vertex(graph, start_vertex)
      graph[start_vertex][:explored] = true
      graph[start_vertex][:leader] = $s
      puts "vertex #{start_vertex} connected to #{graph[start_vertex][:data].inspect}"
      graph[start_vertex][:data].each do |j|
        add_vertex(graph, j)
        stack << j if !graph[j][:explored]
      end
      # are all the descendents (not just the first layer) explored?
      if stack.all? {|vertex| graph[vertex][:explored]}
        $t += 1
        graph[start_vertex][:finishing] = $t
        $new_order.unshift(start_vertex)
        puts "done exploring vertex #{start_vertex}, finishing order set to #{$t} and added to beginning of new_order"
      else
        stack << start_vertex
      end
      stack_index += 1
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
