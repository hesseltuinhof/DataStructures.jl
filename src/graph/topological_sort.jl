function topologicalsort!(g::AbstractGraph)
    for v = 1:countvertices(g)
        setmark!(g, v, 0)
    end
    for v = 1:countvertices(g)
        if getmark(g, v) == 0
            _topologicalsort!(g, v)
        end
    end
end

function _topologicalsort!(g::AbstractGraph, v::Vertex)
    setmark!(g, v, 1)
    let w = first(g, v)
        while w <= countvertices(g)
            if getmark(g, w) == 0
                _topologicalsort!(g, w)
            end
            w = next(g, v, w)
        end
    end
    println(v)
end

