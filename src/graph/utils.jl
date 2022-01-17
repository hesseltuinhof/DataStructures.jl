function minimumvertex!(g, distance)
    let i = 0, v = 0
        while i < countvertices(g)
            i += 1
            if getmark(g, i) == 0
                v = i
                break
            end
        end
        while i < countvertices(g)
            i += 1
            if getmark(g, i) == 0 && distance[i] < distance[v]
                v = i
            end
        end
        return v
    end
end
