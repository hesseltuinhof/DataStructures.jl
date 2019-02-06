abstract type AbstractGraph end

# TODO Add additional types; make more general
const Vertex = Int

### Interface

# Notation: V={v₁,….vₙ}, edges e=(v,w) where v,w ∈ V

# Return the number of vertices and edges.
countedges(g::AbstractGraph) = nothing
countvertices(g::AbstractGraph) = nothing

# Return first and next neighbor of a vertex.
first(g::AbstractGraph, v::Vertex) = nothing
next(g::AbstractGraph, v::Vertex, w::Vertex) = nothing

# Set the weight for an edge.
setedge!(g::AbstractGraph, v::Vertex, w::Vertex, weight) = nothing

# Remove and return an edge.
remove!(g::AbstractGraph, v::Vertex, w::Vertex) = nothing

# Check if an edge is in the graph.
isedge(g::AbstractGraph, v::Vertex, w::Vertex) = nothing

# Return the weight of an edge.
getweight(g::AbstractGraph, v::Vertex, w::Vertex) = nothing

# Set and return the mark value for a vertex.
getmark(g::AbstractGraph, v::Vertex) = nothing
setmark!(g::AbstractGraph, v::Vertex, value) = nothing

# TODO Add additional functions insert/remove for vertices 
#      (not covered in book)

# Insert n additional vertices to the graph.
addvertex!(g::AbstractGraph, n::Int) = nothing

# Remove and return a vertex.
remove!(g::AbstractGraph, v::Vertex) = nothing

