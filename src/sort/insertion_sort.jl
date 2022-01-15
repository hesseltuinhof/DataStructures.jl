# Note: implement as generic, in order to also support views which are of type SubArray
function insertionsort!(a::AbstractVector, isless=isless)
    for i = 2:length(a)
        for j = i:-1:2
            isless(a[j], a[j-1]) || break
            swap!(a, j, j-1)
        end
    end
    a
end
