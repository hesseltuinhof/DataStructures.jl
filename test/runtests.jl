using InteractiveUtils: subtypes
using Test

using DataStructures

# generic
function test_interface(::Type{T}) where T
    for S in subtypes(T)
        _test_interface(S)
    end
end
function test_interface(::Type{T}, ::Type{U}) where {T,U}
    for S in subtypes(T)
        _test_interface(S{U})
    end
end

# run tests

include("./list.jl")
test_interface(AbstractList, Int)
test_interface(AbstractQueue, Int)
test_interface(AbstractStack, Int)

include("./graph.jl")
test_interface(AbstractGraph)

include("./tree.jl")

include("./sort.jl")
