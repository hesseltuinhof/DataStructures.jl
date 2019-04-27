abstract type AbstractHeap{T} <: AbstractTree{T} end

mutable struct BinaryHeap{T} <: AbstractHeap{T}
    tree::CompleteBinaryTree{T}
    size::Int
    maxsize::Int
    comparator::Function
    function BinaryHeap{T}(data, comparator) where T
        tree = CompleteBinaryTree{T}(data)
        size = tree.size
        maxsize = DEFAULT_MAX_SIZE
        n = new(tree, size, maxsize, comparator)
        buildheap!(n)
    end
end

BinaryHeap(data::Vector, comparator) = BinaryHeap{eltype(data)}(data, comparator)
MinHeap(data::Vector) = BinaryHeap(data, isless)
MaxHeap(data::Vector) = BinaryHeap(data, (x,y)->isless(y,x))

function _siftdown!(h::BinaryHeap, pos)
    let i = pos
        while !isleaf(h.tree, i)
            j = leftchild(h.tree, i)
            rc = rightchild(h.tree, i)
            # check if rightchild is within bounds
            if (rc != 0) && h.comparator(h.tree.data[rc], h.tree.data[j])
                j = rc
            end
            h.comparator(h.tree.data[i], h.tree.data[j]) && break
            swap!(h.tree, i, j)
            i = j
        end
    end
end

function _siftup!(h::BinaryHeap, pos)
    let i = pos
        while (i != 1) && h.comparator(h.tree.data[i], h.tree.data[parent(h.tree, i)])
            swap!(h.tree, i, parent(h.tree, i))
            i = parent(h.tree, i)
        end
    end
end

function insert!(h::BinaryHeap, item)
    (h.size < h.maxsize) || throw(ErrorException("heap capacity exceeded"))
    append!(h.tree, item)
    h.size += 1
    _siftup!(h, h.size)
end
    

function remove!(h::BinaryHeap)
    (h.size > 0) || throw(ArgumentError("no current element"))
    item = h.tree.data[1]
    swap!(h.tree, 1, h.size)
    h.size -= 1; h.tree.size -= 1
    if h.size != 0
        _siftdown!(h, 1)
    end
    return item
end

function remove!(h::BinaryHeap, pos)
    (1 <= pos <= h.size) || throw(BoundsError(h, pos))
    item = h.tree.data[pos]
    if pos == h.size
        h.size -= 1; h.tree.size -= 1
    else
        swap!(h.tree, pos, h.size)
        h.size -= 1; h.tree.size -= 1
        _siftup!(h, pos)
        if h.size != 0
            _siftdown!(h, pos)
        end
    end
    return item
end

function buildheap!(h::BinaryHeap)
    let i = h.size ÷ 2
        while i>0
            _siftdown!(h, i)
            i -= 1
        end
    end
    return h
end

peek(h::BinaryHeap) =  (h.size > 0) ? h.tree.data[1] : throw(ArgumentError("no current element"))
length(h::BinaryHeap) = h.size
isempty(h::BinaryHeap) = h.size == 0
