abstract type AbstractStack{T} end

### Interface

# Push an item onto the top of the stack.
push!(s::AbstractStack, item) = nothing

# Remove and return top element of the stack.
pop!(s::AbstractStack) = nothing

# Return the top element.
topvalue(s::AbstractStack) = nothing

# Return the number of elements in the stack.
length(s::AbstractStack) = nothing

# Check if stack is empty.
isempty(s::AbstractStack) = nothing

### Generic

eltype(s::AbstractStack{T}) where T = T
