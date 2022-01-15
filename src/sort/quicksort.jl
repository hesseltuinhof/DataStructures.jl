function _quicksort!(a::Vector, leftindex, rightindex, isless)
    # Note on chosen optimization:
    # Shaffer recommends to *just* return the small partitions and do a single final insertionsort. We follow Sedgewick
    # here, who recommends to do a insertionsort for the many small partitions. This is the same technique applied to
    # mergesort (see https://algs4.cs.princeton.edu/23quicksort/).
    if (rightindex + 1 - leftindex)  <= 9
        insertionsort!(view(a, leftindex:rightindex), isless)
        return
    end
    pivotindex = _findpivot(a, leftindex, rightindex)
    swap!(a, pivotindex, rightindex)
    newpivotindex = _partition!(a, leftindex-1, rightindex, a[rightindex], isless)
    swap!(a, newpivotindex, rightindex)
    _quicksort!(a, leftindex, newpivotindex-1, isless)
    _quicksort!(a, newpivotindex+1, rightindex, isless)
end

@inline function _findpivot(a, leftindex, rightindex)
    return (leftindex + rightindex) ÷ 2
end

@inline function _partition!(a, leftindex, rightindex, pivot, isless)
    let l = leftindex, r = rightindex
        while true
            l += 1
            while isless(a[l], pivot)
                l += 1
            end
            l < r || break
            r -= 1
            while isless(pivot, a[r])
                l < r || break
                r -= 1
            end
            swap!(a, l, r) # gets bound error
            l < r || break
        end
        return l
    end
end

function quicksort!(a::Vector, isless=isless)
    _quicksort!(a,  1, length(a), isless)
    a
end
