# TODO maxsize should be initialized

#abstract type Heap{T} <: AbstractTree{T} end

mutable struct Heap{T} #<: Heap{T}
    tree::CompleteBinaryTree{T}
    size::Int
    maxsize::Int
    comparator::Function
    function Heap{T}(data, comparator) where T
        tree = CompleteBinaryTree{T}(data)
        size = tree.size
        maxsize = DEFAULT_MAX_SIZE
        n = new(tree, size, maxsize, comparator)
        buildheap!(n)
    end
end

Heap(data::Vector, comparator) = Heap{eltype(data)}(data, comparator)

### TODO alias MaxHeap and MinHeap to _Heap, than based on type specify isless function
# eg. if isa(t, MaxHeap) = (isgreater(x, y) = isless(y,x))

#const MaxHeap{T} = _Heap{T}
#const MinHeap{T} = _Heap{T}

MinHeap(data::Vector) = Heap(data, isless)
MaxHeap(data::Vector) = Heap(data, (x,y)->isless(y,x))



function _siftdown!(h::Heap, pos)
    let i = pos
        while !isleaf(h.tree, i)
            j = leftchild(h.tree, i)
            rc = rightchild(h.tree, i)
            # check if rightchild is within bounds
            # (if rightchild is outside, rc will be 0)
            if (rc != 0) && h.comparator(h.tree.data[rc], h.tree.data[j])
                j = rc
            end
            h.comparator(h.tree.data[i], h.tree.data[j]) && break
            swap!(h.tree, i, j)
            i = j
        end
    end
end

function _siftup!(h::Heap, pos)
    let i = pos
        while (i != 1) && h.comparator(h.tree.data[i], h.tree.data[parent(h.tree, i)])
            swap!(h.tree, i, parent(h.tree, i))
            i = parent(h.tree, i)
        end
    end
end

function insert!(h::Heap, item)
    (h.size < h.maxsize) || throw(ArgumentError("Heap capacity exceeded"))
    append!(h.tree, item)
    h.size += 1
    _siftup!(h, h.size)
end
    

function remove!(h::Heap)
    (h.size > 0) || throw(ArgumentError("Heap is empty."))
    item = h.tree.data[1]
    swap!(h.tree, 1, h.size)
    h.size -= 1; h.tree.size -= 1
    if h.size != 0
        _siftdown!(h, 1)
    end
    return item
end

function remove!(h::Heap, pos)
    (1 <= pos <= h.size) || throw(BoundsError("Position out of range"))
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

function buildheap!(h::Heap)
    let i = h.size ÷ 2
        while i>0
            _siftdown!(h, i)
            i -= 1
        end
    end
    return h
end

peek(h::Heap) = h.tree.data[1]
length(h::Heap) = h.size
isempty(h::Heap) = h.size == 0
