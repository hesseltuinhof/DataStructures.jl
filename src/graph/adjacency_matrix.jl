mutable struct AdjacencyMatrix <: AbstractGraph
    cntedge::Int
    cntvertex::Int
    arr::AbstractMatrix # Should eventually be of type Vertex
    mark::Vector # 0...unvisited ; 1...visited
    function AdjacencyMatrix(n::Int)
        cntedge = 0
        cntvertex = n
        arr = zeros(Int, cntvertex, cntvertex)
        mark = zeros(Int, cntvertex)
        new(cntedge, cntvertex, arr, mark)
    end
end

countedges(g::AdjacencyMatrix) = g.cntedge
countvertices(g::AdjacencyMatrix) = g.cntvertex

function first(g::AdjacencyMatrix, v::Vertex)
    for i = 1:g.cntvertex
        (g.arr[v, i] != 0) && return i
    end
    return g.cntvertex + 1
end

function next(g::AdjacencyMatrix, v::Vertex, w::Vertex)
    for i = w+1:g.cntvertex
        (g.arr[v, i] != 0) && return i
    end
    return g.cntvertex + 1
end

function setedge!(g::AdjacencyMatrix, v::Vertex, w::Vertex, weight)
    (weight > 0) || throw(ArgumentError("Illegal weight value."))
    (g.arr[v, w] == 0) && (g.cntedge += 1)
    g.arr[v, w] = weight
end

function remove!(g::AdjacencyMatrix, v::Vertex, w::Vertex)
    (g.arr[v, w] != 0) && (g.cntedge -= 1)
    g.arr[v, w] = 0
end

isedge(g::AdjacencyMatrix, v::Vertex, w::Vertex) = g.arr[v, w] != 0
getweight(g::AdjacencyMatrix, v::Vertex, w::Vertex) = g.arr[v, w]
getmark(g::AdjacencyMatrix, v::Vertex) = g.mark[v]
setmark!(g::AdjacencyMatrix, v::Vertex, value) = (g.mark[v] = value)
