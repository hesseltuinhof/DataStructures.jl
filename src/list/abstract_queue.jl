abstract type AbstractQueue{T} end

### Interface

# Insert an item at the rear of the queue.
enqueue!(q::AbstractQueue, item) = nothing

# Remove and return element at the front of the queue.
dequeue!(q::AbstractQueue) = nothing

# Return the front element.
frontvalue(q::AbstractQueue) = nothing

# Return the number of elements in the stack.
length(q::AbstractQueue) = nothing

# Check if queue is empty.
isempty(q::AbstractQueue) = nothing

### Generic
eltype(q::AbstractQueue{T}) where T = T
