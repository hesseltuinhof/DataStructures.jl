function dijkstra(g::AbstractGraph, start::Vertex)
    # clear vertex marks
    g.mark = g.mark * 0

    # init distance vector
    distance = fill(Inf, countvertices(g))
    distance[start] = 0

    for i = 1:countvertices(g)
        v = minimumvertex!(g, distance)
        (distance[v] == Inf) && throw(ErrorException("Unreachable vertices."))
        setmark!(g, v, 1)
        let w = first(g, v)
            while w <= countvertices(g)
                newdistance = distance[v] + getweight(g, v, w)
                if distance[w] > newdistance
                    distance[w] = newdistance
                end
                w = next(g, v, w)
            end
        end
    end

    # clear vertex marks
    g.mark = g.mark * 0
    return distance
end

