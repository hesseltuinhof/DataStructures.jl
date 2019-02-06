module DataStructures

# List related
import Base: append!, insert!, pop!, push!
import Base: eltype, isempty, length

export AbstractList, AbstractNode
export ArrayBasedList, LinkedList, LinkNode

export AbstractStack
export LinkedStack

export AbstractQueque
export LinkedQueue

export AbstractDictionary


export movetostart!, movetoposition!, movetoend!, prev!, next!, currentposition, getvalue
export topvalue

export enqueue!, dequeue!, frontvalue

export remove!, removeany!, find

# TODO put linknode out into own file and put it under abstract includes
include("./list/abstract_list.jl")
include("./list/abstract_queue.jl")
include("./list/abstract_stack.jl")
include("./list/abstract_dictionary.jl")

include("./list/array_based_list.jl")
#include("./list/array_based_queque.jl")
#include("./list/array_based_stack.jl")

include("./list/linked_list.jl")
include("./list/linked_queue.jl")
include("./list/linked_stack.jl")

# Binary trees related
import Base: getkey

export BinaryNode
export BinarySearchNode

export getvalue, setvalue!, left, setleft!, right, setright!, isleaf
export getkey, setkey!

export BinarySearchTree

include("./tree/abstract_binarynode.jl")
include("./tree/binarysearch_node.jl")
include("./tree/binarysearch_tree.jl")

# Graph related
import Base: first

export AbstractGraph
export AdjacencyMatrix, Vertex

export countedges, countvertices, first, next, setedge!, remove!, isedge
export getweight, getmark, setmark!

include("./graph/abstract_graph.jl")
include("./graph/adjacency_matrix.jl")

# Internal sorting related

include("./sort/swap.jl")
include("./sort/insertion_sort.jl")
include("./sort/selection_sort.jl")
include("./sort/shellsort.jl")

export insertionsort!, selectionsort!, shellsort!

end
