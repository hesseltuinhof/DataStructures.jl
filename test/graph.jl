function _test_interface(::Type{T}) where T<:AbstractGraph
    @testset "$(T)" begin
        g = T(5)
        @testset "basics" begin
            @test countedges(g) == 0
            @test countvertices(g) == 5
            edges = [(1, 2, 3), (1, 5, 4), (2, 4, 2), (4, 3, 7), (5, 2, 1)]
            map(edges) do (i, j, w)
                setedge!(g, i, j, w)
            end
            @test countedges(g) == 5
            map(edges) do (i, j, w)
                @test isedge(g, i, j) 
                @test getweight(g, i, j) == w
            end
            @test !isedge(g, 3, 4)
            @test first(g, 1) == 2
            @test first(g, 2) == 4
            @test first(g, 3) == 6
            @test first(g, 4) == 3
            @test first(g, 5) == 2
            @test next(g, 1, first(g, 1)) == 5
            @test next(g, 2, first(g, 2)) == 6
            @test next(g, 4, first(g, 4)) == 6
            @test next(g, 5, first(g, 5)) == 6
            @test_throws ArgumentError setedge!(g, 1, 4, -1)
            map(edges) do (i, j, w)
                @test getweight(g, i, j) == w
            end
            map(1:5) do v
                @test getmark(g, v) == 0
            end
            setmark!(g, 1, 1)
            @test getmark(g, 1) == 1
        end
        @testset "remove!" begin
            remove!(g, 1, 5)
            @test !isedge(g, 1, 5)
            remove!(g, 1, 2)
            @test !isedge(g, 1, 2)
            @test getweight(g, 1, 5) == getweight(g, 1, 2) == 0
            @test countedges(g) == 3
        end
    end
end
