graph = {}
File.open('dijsktraData.txt').each do |line|
  data = line.split(" ")
  v = data.shift.to_i
  graph[v] = data.map do |vertex_info|
    vertex_info = vertex_info.split(",").map(&:to_i)
    {vertex: vertex_info[0], weight: vertex_info[1]}
  end
end

def shortest_path(graph, source)
  x = [source]
  distances = {}
  distances[source] = 0
  v = graph.keys
  while (v - x).any?
    winner = {}
    minimum = 1000000
    x.each do |v|
      graph[v].each do |w|
        unless x.include? w[:vertex]
          score = distances[v] + graph[v].find {|obj| obj[:vertex] == w[:vertex] }[:weight]
          if score <= minimum
            winner[:v] = v
            winner[:w] = w[:vertex]
            winner[:score] = score
            minimum = score
          end
        end
      end
    end
    x << winner[:w]
    distances[winner[:w]] = winner[:score]
  end
  distances
end

result = shortest_path(graph, 1)
keys = [7,37,59,82,99,115,133,165,188,197]
keys.map{|key| result[key]}.join(",") # 2599,2610,2947,2052,2367,2399,2029,2442,2505,3068