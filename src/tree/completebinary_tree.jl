mutable struct CompleteBinaryTree{T} <: AbstractTree{T}
    tree::Vector{T}
    size::Int
    function CompleteBinaryTree{T}(size::Int) where T
        tree = Vector{T}(undef, size)
        new(tree, size)
    end
    function CompleteBinaryTree{T}(data) where T
        new(data, length(data))
    end
end

CompleteBinaryTree(data::Vector) = CompleteBinaryTree{eltype(data)}(data)

# Note: It is assumed that pos ∈ [1,tree.size]. Furthermore, if the result
# is out of bounds, zero is returned.

parent(t::CompleteBinaryTree, pos) = pos ÷ 2 
leftchild(t::CompleteBinaryTree, pos) = 2*pos <= t.size ? 2*pos : 0
rightchild(t::CompleteBinaryTree, pos) = 2*pos + 1 <= t.size ? 2*pos + 1 : 0
leftsibling(t::CompleteBinaryTree, pos) = pos&1 == 1 ? pos - 1 : 0 
rightsibling(t::CompleteBinaryTree, pos) = (pos&1 == 0) && (pos + 1 <= t.size) ? pos + 1 : 0
isleaf(t::CompleteBinaryTree, pos) = (pos > n ÷ 2) && (pos <= t.size)
