module DataStructures

# List related
import Base: append!, insert!
import Base: eltype, isempty, length

export AbstractList
export ArrayBasedList, LinkedList, LinkNode

include("./list/abstract_list.jl")
include("./list/array_based_list.jl")
include("./list/array_based_stack.jl")
include("./list/linked_list.jl")


end
