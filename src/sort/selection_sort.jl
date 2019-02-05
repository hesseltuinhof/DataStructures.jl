function selectionsort!(a::Vector, isless=isless)
    for i = 1:length(a)-1
        minindex = i
        for j = length(a):-1:i+1
            if isless(a[j], a[minindex])
                minindex = j
            end
        end
        swap!(a, i, minindex)
    end
    a
end
