mutable struct LinkedStack{T} <: AbstractStack{T}
    top::LinkNode{T}
    size::Int
    LinkedStack{T}() where T = new(LinkNode{T}(), 0) 
end

isempty(l::LinkedStack) = l.size == 0
length(l::LinkedStack) = l.size
topvalue(l::LinkedStack) = isempty(l) ? throw(ArgumentError("Stack is empty")) : l.top.data

function push!(l::LinkedStack, item)
    l.top = LinkNode(l.top, item)
    l.size += 1
end

function pop!(l::LinkedStack)
    (l.size == 0) && throw(ArgumentError("Stack is empty"))
    item = l.top.data
    l.top = l.top.next
    l.size -= 1
    return item
end



