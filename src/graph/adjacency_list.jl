struct _Edge
    vertex::Int
    weight::Int
end
_Edge() = _Edge(-1, -1)
_getweight(e::_Edge) = e.weight
_getvertex(e::_Edge) = e.vertex

mutable struct AdjacencyList <: AbstractGraph
    cntedge::Int
    cntvertex::Int
    vertex::Vector # Should eventually be of type Vertex
    mark::Vector # 0...unvisited; 1...visited
    function AdjacencyList(n::Int)
        cntedge = 0
        cntvertex = n
        vertex = Vector{LinkedList{_Edge}}(undef, cntvertex)
        for i = 1:cntvertex
            vertex[i] = LinkedList{_Edge}()
        end
        mark = zeros(Int, cntvertex)
        new(cntedge, cntvertex, vertex, mark)
    end
end

countedges(g::AdjacencyList) = g.cntedge
countvertices(g::AdjacencyList) = g.cntvertex

function first(g::AdjacencyList, v::Vertex)
    isempty(g.vertex[v]) && return g.cntvertex + 1
    movetostart!(g.vertex[v])
    edge = getvalue(g.vertex[v])
    return _getvertex(edge)
end

function next(g::AdjacencyList, v::Vertex, w::Vertex)
    if isedge(g, v, w)
        if currentposition(g.vertex[v]) < length(g.vertex[v])
            next!(g.vertex[v])
            edge = getvalue(g.vertex[v]) 
            return _getvertex(edge)
        end
    end
    return g.cntvertex + 1
end


function setedge!(g::AdjacencyList, v::Vertex, w::Vertex, weight)
    (weight > 0) || throw(ArgumentError("Illegal weight value."))
    edge = _Edge(w, weight)
    if isedge(g, v, w)
        remove!(g.vertex[v])
        insert!(g.vertex[v], edge)
    else
        g.cntedge += 1
        movetostart!(g.vertex[v])
        while currentposition(g.vertex[v]) <= length(g.vertex[v])
            currentedge = getvalue(g.vertex[v])
            (_getvertex(currentedge) > w) && break
            next!(g.vertex[v])
        end
        insert!(g.vertex[v], edge)
    end
end

function remove!(g::AdjacencyList, v::Vertex, w::Vertex)
    if isedge(g, v, w)
        remove!(g.vertex[v])
        g.cntedge -= 1
    end
end

function isedge(g::AdjacencyList, v::Vertex, w::Vertex)
    movetostart!(g.vertex[v])
    while currentposition(g.vertex[v]) <= length(g.vertex[v])
        edge = getvalue(g.vertex[v])
        if _getvertex(edge) == w
            return true
        end
        next!(g.vertex[v])
    end
    return false
end

function getweight(g::AdjacencyList, v::Vertex, w::Vertex)
    if isedge(g, v, w)
        edge = getvalue(g.vertex[v])
        return _getweight(edge)
    else 
        return 0
    end
end

getmark(g::AdjacencyList, v::Vertex) = g.mark[v]
setmark!(g::AdjacencyList, v::Vertex, value) = (g.mark[v] = value)
