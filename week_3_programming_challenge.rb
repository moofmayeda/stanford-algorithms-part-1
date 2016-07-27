def choose_edge(graph)
  keys = graph.keys
  first_vertex = graph.keys[rand(graph.keys.count)]
  possibilities = graph[first_vertex]
  num_of_possibilities = possibilities.count
  random_index = rand(possibilities.count)
  second_vertex = possibilities[random_index]
  [first_vertex, second_vertex]
end

def contract(graph, edge)
  graph[edge[0]] += graph[edge[1]]
  graph.delete(edge[1])
  graph[edge[0]].delete_if { |v| edge.include? v }
  graph.values.each{|a| a.map!{|v| v == edge[1] ? edge[0] : v}}
end

def min_cut(graph)
  if graph.count > 2
    edge = choose_edge(graph)
    contract(graph, edge)
    min_cut(graph)
  else
    graph.values.first.count
  end
end

def many_trials(t)
  n = `wc -l "kargerMinCut.txt"`.strip.split(' ')[0].to_i
  min = n * (n - 1) / 2
  t.times do
    graph = {}
    File.open('kargerMinCut.txt').each do |line|
      array = line.split(" ").map(&:to_i)
      graph[array.shift] = array
    end
    result = min_cut(graph)
    min = [result, min].min
  end
  min
end

many_trials(1000) # 17
