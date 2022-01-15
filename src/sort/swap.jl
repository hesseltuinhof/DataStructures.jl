# Note: implement as generic, in order to also support views which are of type SubArray
@inline function swap!(a::AbstractVector, i, j)
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
    a
end
