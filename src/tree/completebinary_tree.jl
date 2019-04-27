mutable struct CompleteBinaryTree{T} <: AbstractTree{T}
    data::Vector{T}
    size::Int
    function CompleteBinaryTree{T}(size::Int) where T
        data = Vector{T}(undef, size)
        new(data, size)
    end
    function CompleteBinaryTree{T}(data) where T
        new(copy(data), length(data))
    end
end

CompleteBinaryTree(data::Vector) = CompleteBinaryTree{eltype(data)}(data)

# TODO add function such that for t(pos) = t.data[pos] 

# Note: It is assumed that pos ∈ [1,tree.size]. Furthermore, if the result
# is out of bounds, zero is returned.

parent(t::CompleteBinaryTree, pos) = pos ÷ 2 
leftchild(t::CompleteBinaryTree, pos) = 2*pos <= t.size ? 2*pos : 0
rightchild(t::CompleteBinaryTree, pos) = 2*pos + 1 <= t.size ? 2*pos + 1 : 0
leftsibling(t::CompleteBinaryTree, pos) = pos&1 == 1 ? pos - 1 : 0 
rightsibling(t::CompleteBinaryTree, pos) = (pos&1 == 0) && (pos + 1 <= t.size) ? pos + 1 : 0
isleaf(t::CompleteBinaryTree, pos) = (pos > t.size ÷ 2) && (pos <= t.size)

swap!(t::CompleteBinaryTree, i, j) = swap!(t.data, i, j)

# TODO this breaks interface of array-based list, where append! is used
function append!(t::CompleteBinaryTree, item)
    if length(t.data) == t.size
        t.size += 1
        push!(t.data, item)
    else
        t.size += 1
        t.data[t.size] = item
    end
end
