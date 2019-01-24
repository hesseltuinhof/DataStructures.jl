module DataStructures

# List related
import Base: append!, insert!, pop!, push!
import Base: eltype, isempty, length

export AbstractList
export ArrayBasedList, LinkedList, LinkNode

export AbstractStack
export LinkedStack

export AbstractQueque
export LinkedQueue

export movetostart!, movetoposition!, movetoend!, prev!, next!, currentposition, getvalue
export topvalue

export enqueue!, dequeue!, frontvalue

# TODO put linknode out into own file and put it under abstract includes
include("./list/abstract_list.jl")
include("./list/abstract_queque.jl")
include("./list/abstract_stack.jl")

include("./list/array_based_list.jl")
#include("./list/array_based_queque.jl")
#include("./list/array_based_stack.jl")

include("./list/linked_list.jl")
include("./list/linked_queue.jl")
include("./list/linked_stack.jl")

end
