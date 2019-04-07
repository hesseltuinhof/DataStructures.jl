module DataStructures

### List related

import Base: append!, insert!, pop!, push!
import Base: eltype, isempty, length, show

export AbstractList, AbstractNode
export ArrayBasedList, LinkedList, LinkNode

export AbstractStack
export LinkedStack

export AbstractQueue
export LinkedQueue, PriorityQueue, KeyValuePair

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


### Binary trees related

import Base: getkey, parent

export BinaryNode
export BinarySearchNode

export getvalue, setvalue!, setleftchild!, setrightchild!, isleaf
export getkey, setkey!

export AbstractTree
export BinarySearchTree, CompleteBinaryTree, Heap, MinHeap, MaxHeap

export parent, leftchild, rightchild, leftsibling, rightsibling
export peek, buildheap!

include("./tree/abstract_binarynode.jl")
include("./tree/abstract_tree.jl")

include("./tree/binarysearch_node.jl")
include("./tree/binarysearch_tree.jl")
include("./tree/completebinary_tree.jl")
include("./tree/heap.jl")

include("./list/priorityqueue.jl") # belongs to list section

### Graph related

import Base: first

export AbstractGraph
export AdjacencyList, AdjacencyMatrix, Vertex

export countedges, countvertices, first, next, setedge!, remove!, isedge
export getweight, getmark, setmark!

export breadthfirstsearch!, depthfirstsearch!, topologicalsort!

include("./graph/abstract_graph.jl")

include("./graph/adjacency_list.jl")
include("./graph/adjacency_matrix.jl")

include("./graph/bfs.jl")
include("./graph/dfs.jl")
include("./graph/topological_sort.jl")

### Internal sorting related

include("./sort/swap.jl")
include("./sort/heapsort.jl")
include("./sort/insertion_sort.jl")
include("./sort/mergesort.jl")
include("./sort/selection_sort.jl")
include("./sort/shellsort.jl")
include("./sort/quicksort.jl")

export insertionsort!, mergesort!, selectionsort!, shellsort!
export quicksort!, heapsort!

### Others

include("./search/binarysearch.jl")

export binarysearch

end
