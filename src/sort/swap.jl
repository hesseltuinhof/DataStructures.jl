@inline function swap!(a::Vector, i, j)
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
    a
end
