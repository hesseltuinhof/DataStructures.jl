abstract type AbstractDictionary{T, K} end

### Interface 

# Insert a (key, record) pair.
insert!(d::AbstractDictionary, key, item) = nothing

# Remove and return one out of possible many records given a key.
remove!(d::AbstractDictionary, key) = nothing

# Remove and return an arbitrary record.
removeany!(d::AbstractDictionary) = nothing

# Return one out of possible many records given a key.
find(d::AbstractDictionary, key) = nothing

# Return the number of records in the dictionary.
length(d::AbstractDictionary) = nothing

# Check if dictionary is empty.
isempty(d::AbstractDictionary) = nothing

### Generic

#eltype(d::AbstractDictionary{T, K}) where {T, K} = T
