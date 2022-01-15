function _mergesort!(a::Vector, tmp::Vector, leftindex, rightindex, isless)
    if (rightindex + 1 - leftindex)  <= 9
        insertionsort!(view(a, leftindex:rightindex), isless)
        return 
    end
    midindex = (leftindex + rightindex) ÷ 2
    _mergesort!(a, tmp, leftindex, midindex, isless)
    _mergesort!(a, tmp, midindex+1, rightindex, isless)

    for i = midindex:-1:leftindex
        tmp[i] = a[i]
    end
    for j = 1:rightindex-midindex
        tmp[rightindex-j+1] = a[midindex+j]
    end
    let i = k = leftindex, j = rightindex
        while k <= rightindex
            if isless(tmp[i], tmp[j])
                a[k] = tmp[i]
                i += 1
            else
                a[k] = tmp[j]
                j -= 1
            end
            k += 1
        end
    end
end

function mergesort!(a::Vector, isless=isless)
    _mergesort!(a, similar(a), 1, length(a), isless)
    a
end
