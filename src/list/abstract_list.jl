abstract type AbstractList{T} end

### Interface

# Insert an item at the current position.
insert!(l::AbstractList, item) = nothing

# Append an item at the end.
append!(l::AbstractList, item) = nothing

# Remove and return the current item.
remove!(l::AbstractList) = nothing

# Set current position to the start/end/position.
movetostart!(l::AbstractList) = nothing
movetoend!(l::AbstractList) = nothing
movetoposition!(l::AbstractList, pos) = nothing

# Move current position one step left/right.
prev!(l::AbstractList) = nothing
next!(l::AbstractList) = nothing

# Return the position of the current element.
currentposition(l::AbstractList) = nothing

# Return the current element.
getvalue(l::AbstractList) = nothing

# Return the number of elements in the list.
length(l::AbstractList) = nothing

# Check if list is empty.
isempty(l::AbstractList) = nothing
