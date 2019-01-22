module DataStructures

# List related
import Base: append!, insert!, pop!, push!
import Base: eltype, isempty, length

export AbstractList
export ArrayBasedList, LinkedList, LinkNode

export AbstractStack

include("./list/abstract_list.jl")
include("./list/abstract_stack.jl")
include("./list/array_based_list.jl")
include("./list/array_based_stack.jl")
include("./list/linked_list.jl")


end
