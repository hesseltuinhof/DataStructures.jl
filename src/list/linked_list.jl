abstract type AbstractNode{T} end

mutable struct LinkNode{T} <: AbstractNode{T}
    next::LinkNode{T}
    data::T
    LinkNode{T}(next, data) where T = new(next, data)
    LinkNode{T}() where T = (n = new(); n.next = n; n)
    LinkNode{T}(data) where T = (n = new(); n.data = data; n.next = n; n)
end

#LinkNode(next, data::T) where T = LinkNode{T}(next, data)
LinkNode(data::T) where T = LinkNode{T}(data)
LinkNode(next::LinkNode{T}, data) where T = LinkNode{T}(next, data)
 
mutable struct LinkedList{T} <: AbstractList{T}
    head::LinkNode{T}
    tail::LinkNode{T}
    curr::LinkNode{T}
    cnt::Int
    function LinkedList{T}() where T
        head = tail = curr = LinkNode{T}()
        cnt = 0
        new(head, tail, curr, cnt)
    end
end

isempty(l::LinkedList) = l.cnt == 0
length(l::LinkedList) = l.cnt

function insert!(l::LinkedList, item)
    l.curr.next= LinkNode(l.curr.next, item)
    if l.tail === l.curr
        l.tail = l.curr.next
    end
    l.cnt += 1
end

function append!(l::LinkedList, item)
    l.tail = l.tail.next = LinkNode{eltype(l)}(item)
    l.cnt += 1
end

function remove!(l::LinkedList)
    (l.curr === l.tail) && throw(ArgumentError("no current element"))
    item = l.curr.next.data
    if l.curr.next === l.tail
        l.tail = l.curr
    end
    l.curr.next = l.curr.next.next
    l.cnt -= 1
    return item
end

function movetostart!(l::LinkedList)
    l.curr = l.head
end

function movetoend!(l::LinkedList)
    l.curr = l.tail
end

function movetoposition!(l::LinkedList, pos)
    (1 <= pos <= l.cnt+1) || throw(BoundsError(l, pos))
    l.curr = l.head
    for i = 1:pos-1
       l.curr = l.curr.next 
    end
end

function prev!(l::LinkedList)
    (l.curr === l.head) && return 
    tmp = l.head
    while l.curr !== tmp.next
        tmp = tmp.next
    end
    l.curr = tmp
end

function next!(l::LinkedList)
    if l.curr !== l.tail
        l.curr = l.curr.next
    end
end

function currentposition(l::LinkedList)
    tmp = l.head
    i = 1
    while l.curr !== tmp
        tmp = tmp.next
        i += 1
    end
    return i
end

function getvalue(l::LinkedList)
    (l.curr === l.tail) && throw(ArgumentError("no current element"))
    return l.curr.next.data
end
