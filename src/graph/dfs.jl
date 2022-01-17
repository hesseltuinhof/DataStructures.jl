function depthfirstsearch!(g::AbstractGraph, v::Vertex)
    #previsit(g, v)
    setmark!(g, v, 1)
    let w = first(g, v)
        while w <= countvertices(g)
            if getmark(g, w) == 0
                #process(g, v, w)
                println(v, w)
                depthfirstsearch!(g, w)
            end
            w = next(g, v, w)
        end
    end
    #postvisit(g, v)
end

