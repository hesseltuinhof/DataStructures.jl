function breadthfirstsearch!(g::AbstractGraph, start::Vertex)
    q = LinkedQueue{typeof(start)}()
    enqueue!(q, start)
    setmark!(g, start, 1)
    while length(q) != 0
        v = dequeue!(q)
        #previsit(g, v)
        let w = first(g, v)
            while w <= countvertices(g)
                if getmark(g, w) == 0
                    setmark!(g, w, 1)
                    enqueue!(q, w)
                    #process(g, v, w)
                    println(v, w)
                end
                w = next(g, v, w)
            end
        end
    end
end
