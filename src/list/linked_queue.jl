mutable struct LinkedQueue{T} <: AbstractQueue{T}
    front::LinkNode{T}
    rear::LinkNode{T}
    size::Int
    function LinkedQueue{T}() where T
        front = rear = LinkNode{T}()
        size = 0
        new(front, rear, size)
    end
end


isempty(q::LinkedQueue) = q.size == 0
length(q::LinkedQueue) = q.size
frontvalue(q::LinkedQueue) = isempty(q) ? throw(ArgumentError("Queue is empty")) : q.front.next.data


function enqueue!(q::LinkedQueue, item)
    q.rear = q.rear.next = LinkNode{eltype(q)}(item)
    q.size += 1
end

function dequeue!(q::LinkedQueue)
    (q.size == 0) && throw(ArgumentError("Queue is empty"))
    item = q.front.next.data
    if q.front.next === q.rear
        q.rear = q.front
    end
    q.front.next = q.front.next.next
    q.size -= 1
    return item
end
