@testset "BinaryHeap" begin
    data = [16, 2, 6, 5, 7, 1, 3, 4, 11]
    @testset "MinHeap" begin
        @testset "init heap/buildheap!" begin
            h = MinHeap(data)
            @test peek(h) == 1
            @test length(h) == 9
            @test !isempty(h)
            @test isequal(h.tree.data, [1, 2, 3, 4, 7, 6, 16, 5, 11])
        end
        @testset "insert! and remove!" begin
            h = MinHeap(Vector{Int}())
            @test_throws ArgumentError peek(h)
            @test length(h) == 0
            @test isempty(h)
            expected = [
                 [16],
                 [2, 16],
                 [2, 16, 6],
                 [2, 5, 6, 16],
                 [2, 5, 6, 16, 7],
                 [1, 5, 2, 16, 7, 6],
                 [1, 5, 2, 16, 7, 6, 3],
                 [1, 4, 2, 5, 7, 6, 3, 16],
                 [1, 4, 2, 5, 7, 6, 3, 16, 11]]
            for i = 1:length(data)
                insert!(h, data[i])
                @test length(h) == i
                @test !isempty(h)
                @test isequal(h.tree.data, expected[i])
            end
            removed = [1, 2, 3, 4, 5, 6, 7, 11, 16] 
            while !isempty(h)
                @test remove!(h) == popfirst!(removed)
            end
        end
        @testset "remove! at position" begin
            h = MinHeap(data)
            @test_throws BoundsError(h, 10) remove!(h, 10)
            @test remove!(h, length(h)) == 11
            @test remove!(h, 3) == 3
            @test length(h) == 7
        end
    end
    @testset "MaxHeap" begin
        @testset "init heap/buildheap!" begin
            h = MaxHeap(data)
            @test peek(h) == 16
            @test length(h) == 9
            @test !isempty(h)
            @test isequal(h.tree.data, [16, 11, 6, 5, 7, 1, 3, 4, 2])
        end
        @testset "insert! and remove!" begin
            h = MaxHeap(Vector{Int}())
            @test_throws ArgumentError peek(h)
            @test length(h) == 0
            @test isempty(h)
            expected = [
                 [16],
                 [16, 2],
                 [16, 2, 6],
                 [16, 5, 6, 2],
                 [16, 7, 6, 2, 5],
                 [16, 7, 6, 2, 5, 1],
                 [16, 7, 6, 2, 5, 1, 3],
                 [16, 7, 6, 4, 5, 1, 3, 2],
                 [16, 11, 6, 7, 5, 1, 3, 2, 4]]
            for i = 1:length(data)
                insert!(h, data[i])
                @test length(h) == i
                @test !isempty(h)
                @test isequal(h.tree.data, expected[i])
            end
            removed = [1, 2, 3, 4, 5, 6, 7, 11, 16] 
            while !isempty(h)
                @test remove!(h) == pop!(removed)
            end
        end
        @testset "remove! at position" begin
            h = MaxHeap(data)
            @test_throws BoundsError(h, 10) remove!(h, 10)
            @test remove!(h, length(h)) == 2
            @test remove!(h, 2) == 11
            @test length(h) == 7
        end
    end
end

