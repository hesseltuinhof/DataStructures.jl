mutable struct ArrayBasedList{T} <: AbstractList{T}
    maxsize::Int
    size::Int
    curr::Int
    data::Vector{T}
    function ArrayBasedList{T}(maxsize::Int) where T
        size = 0
        curr = 1
        new(maxsize, size, curr, Vector{T}(undef, maxsize))
    end
end

ArrayBasedList{T}() where T = ArrayBasedList{T}(DEFAULT_MAX_SIZE)

isempty(l::ArrayBasedList) = l.size == 0
length(l::ArrayBasedList) = l.size

function insert!(l::ArrayBasedList, item)
    (l.size < l.maxsize) || throw(ErrorException("list capacity exceeded"))
    l.size += 1
    for i = l.size:-1:l.curr+1
        l.data[i] = l.data[i-1]
    end
    l.data[l.curr] = item
end

function append!(l::ArrayBasedList, item)
    (l.size < l.maxsize) || throw(ErrorException("list capacity exceeded"))
    l.size += 1
    l.data[l.size] = item
end

function remove!(l::ArrayBasedList)
    (1 <= l.curr <= l.size) || throw(ArgumentError("no current element"))
    # TODO unhandled case: movetoend -> remove -> remove
    item = l.data[l.curr]
    for i = l.curr:l.size-1
        l.data[i] = l.data[i+1]
    end
    l.size -= 1
    return item
end

function movetostart!(l::ArrayBasedList)
    l.curr = 1
end

function movetoend!(l::ArrayBasedList)
    l.curr = l.size + 1
end

function movetoposition!(l::ArrayBasedList, pos)
    (1 <= pos <= l.size+1) || throw(BoundsError(l, pos))
    l.curr = pos
end


prev!(l::ArrayBasedList) = (l.curr > 1) ? l.curr -= 1 : nothing
next!(l::ArrayBasedList) = (l.curr <= l.size) ? l.curr += 1 : nothing
currentposition(l::ArrayBasedList) = l.curr
function getvalue(l::ArrayBasedList)
    (1 <= l.curr <= l.size) || throw(ArgumentError("no current element"))
    return l.data[l.curr]
end
