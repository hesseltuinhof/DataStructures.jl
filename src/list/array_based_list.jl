const DEFAULT_MAX_SIZE = 1024

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
    (l.size >= l.maxsize) && throw(BoundsError("List capacity exceeded"))
    for i = l.size:-1:l.curr+1
        l.data[i] = l.data[i-1]
    end
    l.data[l.curr] = item
    l.size += 1
end

function append!(l::ArrayBasedList, item)
    (l.size >= l.maxsize) && throw(BoundsError("List capacity exceeded"))
    l.size += 1
    l.data[l.size] = item
end

function remove!(l::ArrayBasedList)
    isempty(l) && throw(ArgumentError("List is empty"))
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
    l.curr = l.size
end

function movetoposition!(l::ArrayBasedList, pos)
    (1 > pos > size) && throw(BoundsError("Position out of range"))
    l.curr = pos
end


prev!(l::ArrayBasedList) = (l.curr > 0) ? l.curr -= 1 : nothing
next!(l::ArrayBasedList) = (l.curr < l.size) ? l.curr += 1 : nothing
currentposition(l::ArrayBasedList) = l.curr
getvalue(l::ArrayBasedList) = isempty(l) ? throw(ArgumentError("List is empty")) : l.data[l.curr]
