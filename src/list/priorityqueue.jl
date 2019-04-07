mutable struct KeyValuePair{T, S}
    key::T
    priority::S
end

mutable struct PriorityQueue{T<:KeyValuePair} #<: AbstractQueue{T}
    heap::Heap{T}
    function PriorityQueue{T}(data) where T
        heap = Heap{T}(data, (x,y)->isless(y.priority, x.priority))
        new(heap)
    end
end

PriorityQueue(data::Vector) = PriorityQueue{eltype(data)}(data)

function enqueue!(q::PriorityQueue, item)
    insert!(q.heap, item)
end

function dequeue!(q::PriorityQueue)
    remove!(q.heap)
end

length(p::PriorityQueue) = length(p.heap)
isempty(p::PriorityQueue) = isempty(p.heap)
