mutable struct Heap{T} <: AbstractTree{T}
    tree::CompleteBinaryTree{T}
    size::Int
    maxsize::Int
    function Heap{T}(tree) where T
       tree = tree
       size = tree.size
       maxsize = DEFAULT_MAX_SIZE
       n = new(tree, size, maxsize)
       heapify!(n)
    end
end


function _siftdown! end

function _siftup! end

function push! end

function pop! end

function remove! end

function peek end

function heapify!() end
# length() = nothing
# isempty() = nothing
