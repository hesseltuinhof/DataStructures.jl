function jarnik(g::AbstractGraph, start::Vertex)
    # clear vertex marks
    g.mark = g.mark * 0

    # init minimum spanning tree, distance and vertex vectors
    mst = typeof(g)(countvertices(g))
    vertices = fill(start, countvertices(g))
    distance = fill(Inf, countvertices(g))
    distance[start] = 0
    for i = 1:countvertices(g)
        v = minimumvertex!(g, distance)
        if (v != start)
            setedge!(mst, vertices[v], v, getweight(g, vertices[v], v))
            setedge!(mst, v, vertices[v], getweight(g, v, vertices[v]))
            # println((vertices[v], v), " ", getweight(g, vertices[v], v))
        end
        (distance[v] == Inf) && throw(ErrorException("Unreachable vertices."))
        setmark!(g, v, 1)
        let w = first(g, v)
            while w <= countvertices(g)
                if distance[w] > getweight(g, v, w)
                    distance[w] = getweight(g, v, w)
                    vertices[w] = v
                end
                w = next(g, v, w)
            end
        end
    end
    # clear vertex marks
    g.mark = g.mark * 0
    return mst
end
