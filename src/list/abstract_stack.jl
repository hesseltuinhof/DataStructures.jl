abstract type AbstractStack{T} end

### Interface

# Push an item onto the top of the stack.
push!(l::AbstractStack, item) = nothing

# Remove and return top element of the stack.
pop!(l::AbstractStack) = nothing

# Return the top element.
topvalue(l::AbstractStack) = nothing

# Return the number of elements in the stack.
length(l::AbstractStack) = nothing

### Generic

eltype(l::AbstractList{T}) where T = T
