function binarysearch(a::Vector, item, isless=isless)
    leftindex = 1
    rightindex = length(a)
    while leftindex <= rightindex
        middleindex = (leftindex + rightindex) ÷ 2
        if isless(a[middleindex], item)
            leftindex = middleindex + 1
        elseif isless(item, a[middleindex])
            rightindex = middleindex - 1
        else
            return middleindex
        end
    end
    return false
end
