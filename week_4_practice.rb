graph = {}
File.open('test.txt').each do |line|
  array = line.split(" ").map(&:to_i)
  graph[array.shift] = {data: array, explored: false}
end

def bfs(graph, start_vertex)
  queue = [start_vertex]
  graph[start_vertex][:explored] = true
  graph[start_vertex][:distance] = 0
  while queue.any?
    v = queue.shift
    graph[v][:data].each do |w|
      if !graph[w][:explored]
        graph[w][:explored] = true
        graph[w][:distance] = graph[v][:distance] + 1
        queue << w
      end
    end
  end
  graph
end

bfs(graph, 1)
