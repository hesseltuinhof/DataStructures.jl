@testset "Internal Sorting" begin
    data = [21, 12, 6, 26, 4, 15, 2, 8, 24, 22, 13, 30, 7, 9, 27, 1, 23, 19, 11, 14, 18, 28, 20, 25, 16, 17, 5, 3, 10, 29]
    @test insertionsort!(copy(data)) == 1:length(data)
    @test selectionsort!(copy(data)) == 1:length(data)
    @test shellsort!(copy(data)) == 1:length(data)

    @test mergesort!(copy(data)) == 1:length(data)
    @test quicksort!(copy(data)) == 1:length(data)

    @test heapsort!(copy(data)) == 1:length(data)
end
