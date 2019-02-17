function heapsort!(a::Vector, isless=(x,y)->isless(y,x))
    heap = Heap(a, isless)
    for i = 1:length(heap)
        remove!(heap)
    end
    heap.tree.data
end
