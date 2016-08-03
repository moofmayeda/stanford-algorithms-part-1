total_lines = `wc -l "SCC.txt"`.strip.split(' ')[0].to_f

graph_array = []
File.open('SCC.txt').each do |line|
  graph_array << line.split(" ").map(&:to_i)
  puts "#{$.}/#{total_lines} (#{$./total_lines * 100}%"
end
graph = {}
reversed_graph = {}
graph_array.each do |array|
  if graph.keys.include? array[0]
    graph[array[0]][:data] << array[1]
  else
    graph[array[0]] = {data: array[1,1], explored: false, leader: nil, finishing: nil}
  end
  if reversed_graph.keys.include? array[1]
    reversed_graph[array[1]][:data] << array[0]
  else
    reversed_graph[array[1]] = {data: array[0,1], explored: false, leader: nil, finishing: nil}
  end
end

(graph.keys - reversed_graph.keys).each do |key|
  reversed_graph[key] = {data: [], explored: false, leader: nil, finishing: nil}
end
(reversed_graph.keys - graph.keys).each do |key|
  graph[key] = {data: [], explored: false, leader: nil, finishing: nil}
end

def dfs_loop(graph)
  $t = 0
  $s = nil
  $new_order = $new_order || []
  if $new_order.empty?
    (graph.count).downto(1) do |i|
      if !graph[i][:explored]
        $s = i
        dfs(graph, i)
      end
    end
  else
    $new_order.each do |i|
      if !graph[i][:explored]
        $s = i
        dfs(graph, i)
      end
    end
  end
  counts_hash = Hash.new(0)
  graph.values.each{|obj| counts_hash[obj[:leader]] += 1}
  counts_hash.sort_by{|k,v| v}.reverse
end

def dfs(graph, start_vertex)
  graph[start_vertex][:explored] = true
  graph[start_vertex][:leader] = $s
  graph[start_vertex][:data].each do |j|
    dfs(graph, j) if !graph[j][:explored]
  end
  $t += 1
  graph[start_vertex][:finishing] = $t
  $new_order.unshift(start_vertex)
end

$new_order = nil
dfs_loop(reversed_graph)
dfs_loop(graph)
