function shellsort!(a::Vector, isless=isless)
    let h = 1
        # calculate the first gap that is too large, i.e.
        # get h(k) such that h(k)=(3^k - 1)/2 > ⌈N/3⌉).
        while (h < length(a)/3) || (h-1 < length(a)/3 <= h)
            h = 3*h + 1
        end
        while h > 1
            # reduce gap
            h = (h-1) ÷ 3
            # iterate over every sublist
            for s = 1:h
                # do a modified insertion sort
                for i = h+s:h:length(a)
                    for j = i:-h:h+s
                        isless(a[j], a[j-h]) || break
                        swap!(a, j, j-h)
                    end
                end
            end
            println(a)
        end
    end 
    a
end

